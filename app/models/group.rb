# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :parent, class_name: 'Group', optional: true
  has_many :groups, foreign_key: :parent_id
  has_many :services

  mount_uploader :icon_static, IconUploader
  mount_uploader :icon_active, IconUploader

  validates_presence_of :title
end
