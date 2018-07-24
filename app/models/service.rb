# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'Profile', optional: true
  has_many :wishlists
  has_one :page, as: :content, dependent: :destroy

  mount_uploader :cover_image, ServicesUploader

  enum status: %i[draft pending published]

  scope :featured, -> { where(featured: true) }

  acts_as_taggable

  accepts_nested_attributes_for :page

  include PgSearch
  pg_search_scope(:search,
    against: [:title, :slug, :content],
    associated_against: {
      tags: [:name],
      category: [:name]
    },
    using: { tsearch: {prefix: true} }
  )

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end

  def wishlisted_by(profile)
    if profile 
      self.wishlists.exists?(profile_id: profile.id)
    end
  end
end
