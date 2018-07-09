class NotificationDecorator < BaseDecorator

  def status
    return 'unread' if unread
    'read'
  end

  def format_date
    created_at.strftime('%^b %-m')
  end
end
