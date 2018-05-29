class InboxController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  before_action :ensure_scope, only: :show
  def show
    @all_messages = current_user.messages
  end
   
  def index
    @unread_messages = current_user.messages.unread.page(params[:page]).per(8)
  end

  private

  def ensure_scope

  end
end
