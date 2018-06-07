class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :parent, class_name: 'Transaction', optional: true
  belongs_to :request
  validates :tx_hash, uniqueness: true
end
