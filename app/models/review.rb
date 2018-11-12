class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :author, class_name: 'Profile'
  belongs_to :request
  enum status: %I[pending completed verifying]

  validates_presence_of :rate, :message
end
