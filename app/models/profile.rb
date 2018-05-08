class Profile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates_presence_of :first_name, :last_name

  mount_uploader :photo, PhotoUploader
end
