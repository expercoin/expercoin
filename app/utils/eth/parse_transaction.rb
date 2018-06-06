class ParseTransaction
  def initialize(transaction)
    @transaction = transaction['body']
    @params = {}
  end

  def perform
    @params['tx_hash'] = tx_hash
    @params
  end

  private

  def tx_hash
    @transaction['tx_hash']
  end
end
