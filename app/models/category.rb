class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :categories, foreign_key: :parent_id

  validates :name, uniqueness: true

  scope :main, -> { where(parent_id: nil ) }

  extend FriendlyId
  friendly_id :name, use: :slugged
end
