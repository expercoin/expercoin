class TransactionValidator < BaseValidator
  validate :required_amount
  validates_presence_of :block_number
  # validates :tx_hash, unique: true

  def initialize(transaction)
    @transaction = transaction
  end

  private

  def request
    @transaction.request
  end

  def block_number
    @transaction.block_number
  end

  def tx_hash
    @transaction.tx_hash
  end

  def amount_to_pay
    request.expert.expercoin_rate * request.requested_length.to_i
  end

  def tx_hash
    @transaction.tx_hash
  end

  def required_amount
    @transaction.block_number
  end

  def required_amount
    return errors.add(:eth_amount, 'Must be valid') if amount_to_pay > @transaction.eth_amount
  end
end
