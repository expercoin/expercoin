class VerifyRequestService < BaseService
  def initalize(params)
    @params = params
    @transaction = Eth::FindTransaction.new(tx_hash)
  end

  def request_verified?
    request.verified?
  end

  def perform
    return unless @transaction.present?
    transaction_params = Eth::ParseTransaction.new(@transaction).perform
    Transaction.create!(transaction_params)
    request.verified!
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
end
