class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :author, class_name: 'Profile'

  validates_presence_of :rate, :message
end