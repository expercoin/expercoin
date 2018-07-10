class Asset < ApplicationRecord
  belongs_to :resource, polymorphic: true
  mount_uploader :file, AssetUploader

  validates_presence_of :name
  validates_presence_of :file
end
