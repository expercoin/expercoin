class ServicesController < ApplicationController
  layout 'dashboard'
  
  def index; end

  def show
    @service = Service.friendly.find(params[:id])
    @providers = @service.profiles
    @featured_provider = @service.featured_profile
  end
end
