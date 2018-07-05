# frozen_string_literal: true

# Message Class for Decorators pattern
class MessageDecorator < BaseDecorator

  def status
    return 'unread' if unread
    'read'
  end

  def format_date
    created_at.strftime('%b %d, %Y at %l:%M %P')
  end

  def sender_photo_thumb
    sender.profile.photo.thumb.url || 'empty_user.png'
  end

  def receiver_name
    receiver.profile.first_name
  end
end
