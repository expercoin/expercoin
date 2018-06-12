# frozen_string_literal: true

class VerifyRequestService < BaseService
  def initialize(params)
    @params = params
    @transaction = Eth::FindTransaction.new(tx_hash).perform
    # @transaction = {"blockHash"=>"0x377e708d28e8588d51f3e8992615d60055f125f76a51b406be96d8fecbace9f1", "blockNumber"=>"0x4cf", "from"=>"0x55437f0109c2f4ecb1e7f54099271aaf913963b0", "gas"=>"0x1de37", "gasPrice"=>"0x430e23400", "hash"=>"0x6a3702ec644a6fcaa134d568e97a672a9b2d2dbc39e75d0bd02c26897908715c", "input"=>"0x", "nonce"=>"0xa", "to"=>"0x13b16a79292c5d9edd908082cd57c9b655ade91f", "transactionIndex"=>"0x0", "value"=>"0x4563918244f40000", "v"=>"0x7d9", "r"=>"0xc3bf2b0e7c1970a669331ced085cedfe19bb41def2ae2019d3ec4fe57b4c7c43", "s"=>"0x7144242051227b9b5bd72c3a237af9240251f58e8a0b8c92345354fc69057106"}
  end

  def request_verified?
    request.verified?
  end

  def perform
    return unless @transaction.present?
    update_request_tx_hash
    create_transaction
    MSP::UpdateRequestStatus.new(request).perform
  end

  def error_message
    Eth::ErrorMessage.new(@transaction).perform
  end

  def pending
    @transaction&['hash'] && !@transaction&['blockNumber']
  end

  private

  def update_request_tx_hash
    request.update(tx_hash: @transaction['hash'])
  end

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
    transaction_validator = TransactionValidator.new(new_transaction)
    return false unless transaction_validator.valid?
    new_transaction.save
    Eth::ChildTransaction.new(new_transaction).create_transactions
  end

  def transaction_params
    params = Eth::ParseTransaction.new(@transaction).perform
    params['sender'] = sender
    params['parent'] = parent
    params['request'] = request
    params['status'] = 'completed'
    params
  end
end
