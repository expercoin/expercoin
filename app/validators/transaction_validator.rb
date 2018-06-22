class TransactionValidator < BaseValidator
  validate :required_amount
  validates_presence_of :block_number, :eth_amount
  validates :tx_hash, unique: true
  validates :address, presence: true, inclusion: { in: [ENV['ETH_ADDRESS']] }
  validates :status, presence: true, inclusion: { in: ['completed'] }

  attr_reader :transaction

  def initialize(transaction)
    @transaction = transaction
  end

  private

  def status
    @transaction.status
  end

  def address
    @transaction.to_eth
  end

  def request
    @transaction.request
  end

  def block_number
    @transaction.block_number
  end

  def eth_amount
    @transaction.eth_amount
  end

  def tx_hash
    @transaction.tx_hash
  end

  def amount_to_pay
    (request.expert.expercoin_rate * request.requested_length.to_i).to_f.round(18)
  end

  def transaction_amount
    eth_amount || 0
  end

  def required_amount
    return if amount_to_pay <= transaction_amount
    errors.add(:eth_amount, 'Must be valid')
  end
end
