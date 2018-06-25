class ServiceProvider < ApplicationRecord
  belongs_to :service
  belongs_to :profile
end
