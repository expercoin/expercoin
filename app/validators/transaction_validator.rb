class TransactionValidator < BaseValidator
  validate :contract_created
  validates_presence_of :block_number, :eth_amount
  validates :tx_hash, unique: true
  validates :status, presence: true, inclusion: { in: ['completed'] }

  attr_reader :transaction

  def initialize(transaction)
    @transaction = transaction
  end

  private

  def eth_contract
    Eth::Contract.new(tx_hash)
  end

  def contract_created
    return if eth_contract.created? && eth_contract_valid_address? && eth_contract_valid_amount?

    errors.add(:tx_hash, 'Contract Must Be Valid')
  end

  def eth_contract_valid_address?
    eth_contract_address_formated == ENV['ETH_ADDRESS']
  rescue StandardError
    false
  end

  def eth_contract_address_formated
    eth_contract.site_address.sub('000000000000000000000000', '')
  end

  def eth_contract_valid_amount?
    transaction_amount == amount_to_pay
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
    Eth::ValueFormatter.new(eth_contract.amount).from_hex
  rescue StandardError
    0
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
end
