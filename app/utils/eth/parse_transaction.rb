class ParseTransaction
  def initialize(transaction)
    @transaction = transaction
    @params = {}
  end

  def perform
    @params['tx_hash'] = tx_hash
    @params
  end

  private

  def from
    @transaction['from']
  end

  def to
    @transaction['to']
  end

  def tx_hash
    @transaction['hash']
  end

  def block_number
    @transaction['blockNumber']
  end
end
