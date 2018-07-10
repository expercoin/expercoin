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

  def sender_full_name
    sender.profile.first_name << ' ' << sender.profile.last_name 
  end
  
  def time
    created_at.strftime('%l:%M %p')
  end

  def receiver_name
    receiver.profile.first_name
  end

  def primary_asset_link
    return '' unless last_asset
    "<a href=#{last_asset&.file} target='_blank'>#{last_asset&.name}</a>".html_safe
  end

  def last_asset
    assets.last
  end
end
