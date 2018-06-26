# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :group
  has_many :service_providers
  has_many :profiles, through: :service_providers

  mount_uploader :cover_image, ServicesUploader
  mount_uploader :cover_video, VideoUploader

  validates_presence_of :title, :content

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
