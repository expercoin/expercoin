# frozen_string_literal: true

class VerifyRequestService < BaseService
  PARAMS_KEYS = %i[tx_hash sender request parent].freeze

  def initialize(params)
    @params = params
    @transaction = Eth::FindTransaction.new(tx_hash).perform
  end

  def request_verified?
    request.verified?
  end

  def perform
    return unless @transaction.present?
    update_request_tx_hash
    create_transaction
    MSP::UpdateRequestStatus.new(request).perform
    verifying_request_job
  end

  def error_message
    Eth::ErrorMessage.new(@transaction).perform
  end

  def pending?
    @transaction['hash'] && !@transaction['blockNumber'] && AddressValidator.new(@transaction['to']).valid?
  rescue StandardError
    false
  end

  private

  def verifying_request_job
    return if !request.verifying? || transaction_failed?
    UpdateVerifyingRequestJob.set(wait: 2.minutes).perform_later(request)
  end

  def transaction_failed?
    Eth::StatusTransaction.new(tx_hash).fail?
  end

  def transaction_status
    'completed' if Eth::StatusTransaction.new(tx_hash).success?
  end

  def update_request_tx_hash
    return unless AddressValidator.new(@transaction['to']).valid?
    request.update(tx_hash: @transaction['hash'])
  end

  PARAMS_KEYS.each do |key|
    define_method key.to_s do
      @params[key]
    end
  end

  def create_transaction
    new_transaction = Transaction.new(transaction_params)
    transaction_validator = TransactionValidator.new(new_transaction)
    return false unless transaction_validator.valid?
    new_transaction.save
    Eth::ChildTransaction.new(new_transaction).create_transactions
  end

  def transaction_params
    params = Eth::ParseTransaction.new(@transaction).perform
    params.merge('sender': sender, 'parent': parent, 'request': request, status: transaction_status)
  end
end
