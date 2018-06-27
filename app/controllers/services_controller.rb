class ServicesController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!, except: [:show]
  before_action :set_profile
  before_action :set_categories

  def new
    @service = @profile.services.new
  end

  def edit
    @service = @profile.services.friendly.find(params[:id])
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

  def update
    @service = @profile.services.friendly.find(params[:id])
    redirect_to service_path(@service) if @service.update(service_params)
  end

  def destroy
    service = current_user.created_services.friendly.find(params[:id])
    ServiceProvider.where(service: service).destroy_all
    redirect_to services_path if service.destroy
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def set_categories
    @categories = Category.children
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
