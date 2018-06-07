class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User', optional: true
  belongs_to :receiver, class_name: 'User', optional: true
  belongs_to :parent, class_name: 'Transaction', optional: true
  belongs_to :request
end
