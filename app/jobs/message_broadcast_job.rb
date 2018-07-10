class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    message = Message.find(message_id)
    sid = message.request.room_sid
    ActionCable.server.broadcast "chat_#{sid}", message: render_message(message)
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: {message: message}
  end
end