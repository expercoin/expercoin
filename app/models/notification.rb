class Notification < ApplicationRecord
  belongs_to :user
  belongs_to :resource, polymorphic: true

  enum status: %i[unread read]  

  scope :unread_desc, -> { where(status: 0).order("created_at DESC") }
end
