class Service < ApplicationRecord
  belongs_to :group
  mount_uploader :cover_image, PhotoUploader
  mount_uploader :cover_video, VideoUploader
  
end
