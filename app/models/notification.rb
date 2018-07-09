class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :resource, polymorphic: true

  enum status: %i[unread read]
end
