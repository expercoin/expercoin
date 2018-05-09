class Review < ApplicationRecord
  belongs_to :profile
  belongs_to :author, class_name: 'Profile'
  belongs_to :request, optional: true
  
  validates_presence_of :rate, :message
end
