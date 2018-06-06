class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :eth_address
  enum status: %i[pending success failed]
end
