class CallsController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'
  
  def index
    @requests = current_user.profile.requests
    @history = request.url.match('history')
  end

  def show
    @request = current_user.profile.requests.find(params[:id])
  end
end