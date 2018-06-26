class ServiceProvider < ApplicationRecord
  belongs_to :service
  belongs_to :profile
  scope :featured, -> { where(featured: true) }
end
