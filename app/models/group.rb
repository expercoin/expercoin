class Group < ApplicationRecord
  belongs_to :parent, class_name: 'Group', optional: true
  has_many :groups, foreign_key: :parent_id

  scope :main, -> { where(parent_id: nil ) }
end
