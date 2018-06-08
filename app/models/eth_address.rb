class EthAddress < ApplicationRecord
  validates :public_key, format: { with: /\A0x\w{40}\Z/ }

  belongs_to :wallet, optional: true
  has_many :transactions

  scope :safe, -> { where.not(id: nil) }
end
