class Transaction < ApplicationRecord
  # include CustomValidator
  belongs_to :sender, class_name: 'User', optional: true
  belongs_to :receiver, class_name: 'User', optional: true
  belongs_to :parent, class_name: 'Transaction', optional: true
  belongs_to :request

  has_many :transactions, class_name: 'Transaction', foreign_key: :parent_id

  scope :expert, -> { where.not(status: 'completed', parent_id: nil, to_eth: nil, receiver_id: nil, tx_hash: nil) }

  enum status: %i[pending completed]

  include PgSearch
  pg_search_scope(:search,
    against: [:eth_amount],
    associated_against: {
      request: [:title, :message]
    },
    using: { tsearch: { prefix: true } }
  )

  def to_s
    "#{from_eth}  amount: #{eth_amount}"
  end
end
