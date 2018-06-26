class ServicesController < ApplicationController
  layout 'dashboard'
  
  def index; end

  def show
    @service = Service.friendly.find(params[:id])
    @providers = @service.profiles
  end
end
