class ChatChannel < ApplicationCable::Channel
  def subscribed
    stream_from "chat_#{params[:room]}"
  end

  def unsubscribed
  end

  def send_message(data)
    request = Request.find_by_room_sid(data['chatroom_id']) if data['chatroom_id'].present?
    message = request.messages.build(
      sender: current_user,
      title: 'Conferance',
      body: data['message']
    )
    message.save
  end
end