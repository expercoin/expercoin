# frozen_string_literal: true

class ServicesController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!, except: %i[show index]
  before_action :set_profile, except: %i[show index]
  before_action :set_categories, only: %i[new edit]
  before_action :update_first_time, only: %i[index new]

  def new
    @service = @profile.services.new(
      expercoin_rate: @profile.expercoin_rate,
      rate: @profile.rate
    )
    @service_form = ServiceForm.new(@service)
  end

  def edit
    @service = @profile.services.friendly.find(params[:id])
    @service_form = ServiceForm.new(@service)
  end

  def index
    services = SearchService.new(
      Service.published,
      params[:search]
    ).perform
    @services = services.page(params[:page]).per(15)
    @categories = Category.main
  end

  def show
    @service = Service.friendly.find(params[:id])
  end

  def create
    @service_form = ServiceForm.new(service_params.merge(status: 'pending'))
    @service = @service_form.create(Service)
    if @service
      AdminMailer.new_offer(@service)
    else
      flash[:alert] = @service_form.errors.full_messages&.join(', ')
      redirect_to new_service_path
    end
  end

  def update
    @service = @profile.services.friendly.find(params[:id])
    @service_form = ServiceForm.new(service_params)
    redirect_to service_path(@service) if @service_form.update(@service)
  end

  def destroy
    service = @profile.created_services.friendly.find(params[:id])
    redirect_to settings_services_path if service.destroy
  end

  private

  def update_first_time
    current_user.update(first_time: false)
  end

  def set_profile
    @profile = current_user.profile
  end

  def set_categories
    @categories = Category.children
  end

  def service_params
    params.require(:service_form).permit(
      :title,
      :content,
      :cover_image,
      :category_id,
      :expercoin_rate,
      :rate,
      tag_list: []
    ).merge(owner_id: @profile.id)
  end
end
