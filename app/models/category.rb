class Category < ApplicationRecord
  belongs_to :parent, class_name: 'Category', optional: true
  has_many :categories, foreign_key: :parent_id
  has_and_belongs_to_many :profiles

  # validates :name, uniqueness: true

  scope :main, -> { where(parent_id: nil ) }
  scope :children, -> { where.not(parent_id: nil ) }

  mount_uploader :banner, BannerUploader

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :name,
      [:name, :parent_id]
    ]
  end

  def subcategories
    Category.where(parent_id: self.id)
  end  

  def children_profiles
    Profile.distinct.includes(:categories).where(categories: { id: categories.ids })
  end
end
