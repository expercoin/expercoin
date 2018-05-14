class EthAddress < ApplicationRecord
  validates :public_key, format: { with: /\A0x\w{16,}\Z/ }

  belongs_to :wallet
end
