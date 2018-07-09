class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :resource, polymorphic: true
end
