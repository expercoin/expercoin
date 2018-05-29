class Message < ApplicationRecord
  validates :body, presence: true
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :parent, class_name: 'Message', optional: true

  scope :unread,-> { where(unread: true) }
end
