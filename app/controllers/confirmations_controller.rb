class ConfirmationsController < Devise::ConfirmationsController

  protected

  def after_resending_confirmation_instructions_path_for(resource_name)
    pages_confirmation_index_path
  end

  def after_confirmation_path_for(resource_name, resource)
    prospect = Prospect.find_or_create_by(email: resource.email)
    prospect_path(prospect.slug)
  end
end
