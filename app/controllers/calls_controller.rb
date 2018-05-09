class CallsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def index
    @requests = current_user.profile.requests.page(params[:page]).per(8)
    @history = request.url.match('history')
  end

  def show
    @request = current_user.profile.requests.find(params[:id])
  end
end