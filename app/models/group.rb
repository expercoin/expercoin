class Group < ApplicationRecord
  belongs_to :parent, class_name: 'Group', optional: true
  has_many :groups, foreign_key: :parent_id
  has_many :services
  scope :main, -> { where(parent_id: nil) }
  scope :subcategories, -> { where.not(parent_id: nil) }
  mount_uploader :icon_static, IconUploader
  mount_uploader :icon_active, IconUploader

end
