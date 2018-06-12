class AddressValidator < BaseValidator
  validates :address, presence: true, inclusion: { in: [ENV['ETH_ADDRESS']] }

  def initialize(address)
    @address = address
  end

  private

  def address
    @address
  end
end
