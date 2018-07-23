class DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :update_first_time
  layout 'dashboard'

  def index
    @profile = current_user.profile
    @services = @profile.services.page(params[:page]).per(5)
    @message = DashboardMessageFinder.new(current_user).perform
  end

  private

  def update_first_time
    current_user.update(first_time: false)
  end
end
