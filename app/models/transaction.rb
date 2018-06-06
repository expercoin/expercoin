class Transaction < ApplicationRecord
  belongs_to :sender, class_name: 'User'
  enum status: %i[pending success failed]
end
