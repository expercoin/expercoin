class Asset < ApplicationRecord
  belongs_to :resource, polymorphic: true
  mount_uploader :file, AssetUploader
end
