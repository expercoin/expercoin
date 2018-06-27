class ServicesController < ApplicationController
  layout 'dashboard'
  before_action :set_profile

  def new
    @service = @profile.services.new
    @categories = Category.children
  end

  def index
    @services = Service.where(owner: current_user)
  end

  def show
    @service = Service.friendly.find(params[:id])
    @providers = @service.profiles
    @featured_provider = @service.featured_profile
  end

  def create
    @service = Service.new(service_params)
    @service.service_providers.new(profile: @profile, featured: true)
    @service.save
    redirect_to service_path(@service)
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def service_params
    params.require(:service).permit(
      :title,
      :content,
      :cover_image,
      :category_id
    )
  end
end
