class MessagesController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def create
    @message = Message.create(messages_params)
    @message.assets = current_user.assets
    current_user.assets.clear
  end

  private

  def messages_params
    params.require(:message).permit(:title, :body, :receiver_id, :asset).merge(sender: current_user)
  end
end
