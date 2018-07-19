class DashboardController < ApplicationController
  before_action :authenticate_user!
  layout 'dashboard'

  def index
    @profile = current_user.profile
    @services = @profile.services.page(params[:page]).per(5)
  end
end
