class ServicesController < ApplicationController
  def index; end

  def show
    @service = Service.friendly.find(params[:id])
    @providers = @service.profiles
  end
end
