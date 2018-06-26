class ServicesController < ApplicationController
  layout 'dashboard'
  
  def index; end

  def show
    @service = Service.friendly.find(params[:id])
  end
end
