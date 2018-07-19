class RegistrationsController < Devise::RegistrationsController

  protected

  def after_inactive_sign_up_path_for(resource)
    sign_in(resource)
    dashboard_index_path
  end
end
