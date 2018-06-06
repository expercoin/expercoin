class VerifyRequestService < BaseService
  def initalize(params)
    @params = params
    # @transaction = FindTransaction.new(eth_address.public_key)
  end

  def verified?
    request.verified?
  end


  def verify
    # return unless @transaction.present?
    # create_transaction
    request.verified!
  end


  private

  # def create_transaction
  #   TransactionService.new(transaction).create
  # end


  def eth_address
    @params[:eth_address]
  end

  def sender
    @params[:sender]
  end

  def request
    @params[:request]
  end
end
