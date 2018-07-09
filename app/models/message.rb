class Message < ApplicationRecord
  validates :title, :body, presence: true
  belongs_to :sender, class_name: 'User'
  belongs_to :receiver, class_name: 'User'
  belongs_to :parent, class_name: 'Message', optional: true
  belongs_to :request, optional: true

  scope :unread,-> { where(unread: true) }

  include PgSearch
  pg_search_scope :search, against: [:title, :body], using: { tsearch: {prefix: true} }
end
