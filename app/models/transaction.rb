class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  belongs_to :parent, class_name: 'Transaction', optional: true
  validates_presence_of :block_number
end
