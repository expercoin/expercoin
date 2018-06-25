# frozen_string_literal: true

class Group < ApplicationRecord
  belongs_to :parent, class_name: 'Group', optional: true
  has_many :groups, foreign_key: :parent_id
  has_many :services
  scope :main, -> { where(parent_id: nil) }
  scope :children, -> { where.not(parent_id: nil) }
  mount_uploader :icon_static, IconUploader
  mount_uploader :icon_active, IconUploader

  validates_presence_of :title

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      %i[title parent_id]
    ]
  end

  def subgroups
    Group.where(parent_id: self.id)
  end
end
