module Settings
  class ServicesController < ApplicationController
    layout 'profile'
    before_action :authenticate_user!, except: [:show]
    before_action :set_profile, except: [:show]
    before_action :set_categories, only: [:new, :edit]

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
      @featured_provider = @service.featured_profile
      @providers = @service.profiles.where.not(id: @featured_provider.id)
    end

    def create
      @service = Service.new(service_params)
      @service.service_providers.new(profile: @profile, featured: true)
      redirect_to service_path(@service) if @service.save
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
      ).merge(owner: current_user)
    end
  end
end
