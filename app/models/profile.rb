class Profile < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories
  has_many :reviews
  has_many :created_reviews, class_name: 'Review', foreign_key: :author_id

  has_many :requests, foreign_key: :expert_id
  has_many :created_requests, class_name: 'Request', foreign_key: :requester_id


  validates_presence_of :first_name, :last_name

  mount_uploader :photo, PhotoUploader
  extend FriendlyId
  friendly_id :slug_candidates, use: :slugged

  store :location, accessors: %i[address country state city zip_code], coder: JSON

  serialize :specialization, Hash

  def commission_fee
    7
  end
  
  private

  def slug_candidates
    [
      %i[first_name last_name],
      %i[id first_name last_name],
    ]
  end
end
