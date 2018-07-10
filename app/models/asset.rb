# frozen_string_literal: true

require 'file_size_validator'

class Asset < ApplicationRecord
  belongs_to :resource, polymorphic: true, optional: true
  mount_uploader :file, AssetUploader
  mount_base64_uploader :file, AssetUploader

  validates_presence_of :name
  validates :file,
            presence: true,
            file_size: {
              maximum: 10.megabytes.to_i
            }
end
