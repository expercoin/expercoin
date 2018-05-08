class Profile < ApplicationRecord
  belongs_to :user
  validates_presence_of :first_name, :last_name

  mount_uploader :photo, PhotoUploader
end
