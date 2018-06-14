class Transaction < ApplicationRecord
  # include CustomValidator
  belongs_to :sender, class_name: 'User', optional: true
  belongs_to :receiver, class_name: 'User', optional: true
  belongs_to :parent, class_name: 'Transaction', optional: true
  belongs_to :request

  scope :expert, -> { where.not(status: 'completed', parent_id: nil, to_eth: nil, receiver_id: nil, tx_hash: nil) }

  enum status: %i[pending completed]
end
