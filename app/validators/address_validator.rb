class AddressValidator < BaseValidator
  validates :address, presence: true, inclusion: { in: [ENV['ETH_ADDRESS'].downcase] }

  def initialize(address)
    @address = address
  end

  private

  def address
    @address.downcase
  end
end
