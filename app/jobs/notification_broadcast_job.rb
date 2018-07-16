class NotificationBroadcastJob < ApplicationJob
  queue_as :default

  def perform(notification_id)
    Notification.find(notification_id).yield_self do |n|
      ActionCable.server.broadcast "notification_#{n.user.id}", notification: render_notification(n)
    end
  end

  private

  def render_message(notification)
    NotificationController.render partial: 'notifications/notification', locals: { notification: notification }
  end
end
