class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(message_id)
    Message.find(message_id).yield_self do |m|
      ActionCable.server.broadcast "chat_#{m.request.room_sid}", message: render_message(m)
    end
  end

  private

  def render_message(message)
    MessagesController.render partial: 'messages/message', locals: { message: message }
  end
end
