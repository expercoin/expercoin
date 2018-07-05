# frozen_string_literal: true

class Service < ApplicationRecord
  belongs_to :category
  belongs_to :owner, class_name: 'User', optional: true

  mount_uploader :cover_image, ServicesUploader

  enum status: %i[draft pending published]

  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  def slug_candidates
    [
      :title,
      [:title, :id]
    ]
  end
end
