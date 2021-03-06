# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :first_time_redirect
  before_action :set_meta_tags_options

  def after_sign_in_path_for(resource)
    if resource.class.name == 'AdminUser'
      admin_root_path
    elsif resource.class.name == 'User' && resource.first_time
      get_started_index_path
    else
      stored_location_for(resource) || dashboard_index_path
    end
  end

  def set_meta_tags_options
    page = Page.find_by(url: request.path)
    meta_tags_options = PageMetaTagsOptions.new(page).default_options
    set_meta_tags meta_tags_options if meta_tags_options
  end

  def render_404
    render file: "#{Rails.root}/public/404", status: :not_found
  end

  def not_found
    raise ActionController::RoutingError.new('Not Found')
  rescue
    render_404
  end

  protected

  def first_time_redirect
    return if ([params[:controller]] & ['admin', 'get_started', 'sessions', 'services', 'dashboard']).present?
    return unless current_user.try(:first_time)
    redirect_to get_started_index_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end
end
