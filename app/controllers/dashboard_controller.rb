class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def index
    @calls = current_user.profile.requests.count > current_user.profile.created_requests.count
  end
end