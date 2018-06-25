# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :group
  mount_uploader :cover_image, PhotoUploader
  mount_uploader :cover_video, VideoUploader
  

  validates_presence_of :title, :content
end
