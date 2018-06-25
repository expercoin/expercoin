class ServicesController < ApplicationController
  def index; end

  def show
    @service = Service.friendly.find(params[:id])
  end
end
