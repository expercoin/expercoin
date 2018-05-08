class Profile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates_presence_of :first_name, :last_name

  mount_uploader :photo, PhotoUploader
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  store :location, accessors: %i[address country state city], coder: JSON

  private

  def slug_candidates
    [
      :first_name,
      %i[first_name last_name],
      %i[first_name last_name id],
    ]
  end
end
