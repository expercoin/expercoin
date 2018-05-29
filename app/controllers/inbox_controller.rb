class InboxController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  
  def show
    @message = current_user.messages.find(params[:id])
    @profile = @message.sender.profile
  end
   
  def index
    messages = SearchService.new(
      current_user.messages.unread,
      params[:search]
    ).perform
    @unread_messages = messages.unread.page(params[:page]).per(8)
  end

  def all
    messages = SearchService.new(
      current_user.messages,
      params[:search]
    ).perform
    @all_messages = messages.page(params[:page]).per(8)
  end
end
