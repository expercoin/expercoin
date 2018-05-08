class PrecallController < ApplicationController
  before_action :authenticate_user!, :set_profile

  def index; end
  
  private

  def set_profile
    @profile = Profile.friendly.find(params[:profile_id])
  end
end