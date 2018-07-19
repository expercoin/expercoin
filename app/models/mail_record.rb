class MailRecord < ApplicationRecord
  serialize :meta
  belongs_to :recipient, class_name: 'User', optional: true
end
