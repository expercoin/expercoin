class RegistrationsController < Devise::RegistrationsController
  def create
    auth_options = { :recall => 'pages#mentors_home', :scope => :user }
    resource = warden.authenticate!(auth_options)
    super
  end
  protected

  # def after_inactive_sign_up_path_for(resource)
  #   pages_confirmation_index_path
  # end
end
