# frozen_string_literal: true

class VerifyRequestService < BaseService
  def initialize(params)
    @params = params
    @transaction = Eth::FindTransaction.new(tx_hash).perform
  end

  def request_verified?
    request.verified?
  end

  def perform
    return unless @transaction.present?
    create_transaction
    MSP::UpdateRequestStatus.new(request).perform
  end

  def error_message
    Eth::ErrorMessage.new(@transaction).perform
  end

  private

  def tx_hash
    @params[:tx_hash]
  end

  def sender
    @params[:sender]
  end

  def request
    @params[:request]
  end

  def parent
    @params[:parent]
  end

  def create_transaction
    new_transaction = Transaction.new(transaction_params)
    return false unless new_transaction.save
    new_transaction
  end

  def transaction_params
    params = Eth::ParseTransaction.new(@transaction).perform
    params['sender'] = sender
    params['parent'] = parent
    params['request'] = request
    params
  end
end
