class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_#{params[:room]}"
  end

  def unsubscribed; end
end