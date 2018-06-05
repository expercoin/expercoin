class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'Profile'
  belongs_to :receiver, class_name: 'Profile'
  enum status: %i[pending success failed]
end
