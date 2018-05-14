class Wallet < ApplicationRecord
  belongs_to :profile
  has_many :eth_addresses
end
