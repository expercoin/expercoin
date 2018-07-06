class Wishlist < ApplicationRecord
  belongs_to :profile
  belongs_to :service
  belongs_to :wishlisted_service, class_name: 'Service', foreign_key: :service_id
end
