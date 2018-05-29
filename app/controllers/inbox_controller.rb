class InboxController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  before_action :ensure_scope, only: :show
  def show
    @all_messages = current_user.messages
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
   
  private

  def ensure_scope

  end
end
