class TransactionValidator < BaseValidator
  validate :required_amount
  validate :contract_created
  validates_presence_of :block_number, :eth_amount
  validates :tx_hash, unique: true
  validates :status, presence: true, inclusion: { in: ['completed'] }

  attr_reader :transaction

  def initialize(transaction)
    @transaction = transaction
  end

  private

  def contract_created
    return if Eth::Contract.new(tx_hash, amount_to_pay).created?
    errors.add(:tx_hash, 'Contract Must Be Valid')
  end

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
    request.requested_amount_eth || calculated_amount
  end

  def calculated_amount
    amount_in_usd = (request.expert.expercoin_rate / 100) * request.requested_length.to_i
    Eth::UsdConverter.new(amount_in_usd).eth_value
  end

  def transaction_amount
    eth_amount || 0
  end

  def required_amount
    return if amount_to_pay <= transaction_amount

    errors.add(:eth_amount, 'Must be valid')
  end
end
