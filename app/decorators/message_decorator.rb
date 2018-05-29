# frozen_string_literal: true

# Message Class for Decorators pattern
class MessageDecorator < BaseDecorator

  def full_name
    "#{first_name} #{last_name}"
  end

  def status
    return 'unread' if unread
    'read'
  end

  def format_date
    created_at.strftime('%b %d, %Y at %l:%M %P')
  end
end
