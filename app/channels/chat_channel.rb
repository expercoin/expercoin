class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def unsubscribed
  end

  def send_message(data)
    return unless data['chatroom_id'].present?
    request = Request.find_by_room_sid(data['chatroom_id'])
    message = request.messages.build(
      sender: current_user,
      title: 'Conferance',
      body: data['message']
    )
    return unless message.save
    message.assets.create!(name: data['original_name'], file: data['file_uri']) if data['file_uri']
    broadcast_message(message.id)
  end

  private

  def broadcast_message(id)
    MessageBroadcastJob.perform_later(id)
  end
end