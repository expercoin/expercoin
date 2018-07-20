# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :first_time_redirect

  def after_sign_in_path_for(resource)
    dashboard_index_path
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
    return if ([params[:controller]] & ['get_started', 'sessions']).present?
    return unless current_user&.first_time
    redirect_to get_started_index_path
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :email, :password, :password_confirmation])
  end
end
