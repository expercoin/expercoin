class MessagesController < ApplicationController
  include Notifiable
  layout 'dashboard'
  before_action :authenticate_user!

  def create
    @message = Message.create(messages_params)
    create_message_notification('new')
    @message.assets = current_user.assets
    current_user.assets.clear
    send_email
  end

  private

  def send_email
    MessageMailer.new_message(@message).deliver_later unless @message.parent_id
    MessageMailer.reply_message(@message).deliver_later if @message.parent_id
  end

  def messages_params
    params.require(:message).permit(:parent_id, :title, :body, :receiver_id, :asset).merge(sender: current_user)
  end
end
