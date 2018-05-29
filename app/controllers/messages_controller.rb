class MessagesController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def create
    @message = Message.create(messages_params)
  end

  private

  def messages_params
    params.require(:message).permit(:title, :body, :receiver_id).merge(sender: current_user)
  end
end
