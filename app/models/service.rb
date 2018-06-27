# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :category
  belongs_to :user, optional: true
  has_many :service_providers
  has_many :profiles, through: :service_providers
  has_many :featured_service_providers, -> { featured }, class_name: 'ServiceProvider'

  mount_uploader :cover_image, ServicesUploader
  mount_uploader :cover_video, VideoUploader

  validates_presence_of :title, :content
  validates_presence_of :service_providers

  accepts_nested_attributes_for :service_providers

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def featured_profile
    featured_service_providers.first&.profile || service_providers.first.profile
  end

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
