# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :parent, class_name: 'Group', optional: true
  has_many :groups, foreign_key: :parent_id
  has_many :services
<<<<<<< HEAD
  scope :main, -> { where(parent_id: nil) }
  scope :subcategories, -> { where.not(parent_id: nil) }
  mount_uploader :icon_static, IconUploader
  mount_uploader :icon_active, IconUploader

=======

  mount_uploader :icon_static, IconUploader
  mount_uploader :icon_active, IconUploader

  validates_presence_of :title
>>>>>>> f4fc446ad66d31868fd474431f36dcc4a68e7a8c
end
