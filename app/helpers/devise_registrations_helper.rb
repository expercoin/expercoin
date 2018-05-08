module DeviseRegistrationsHelper
  def only_email_errors?
    resource.errors.details.keys == [:email]
  end

  def only_email_taken_errors?
    resource.errors.details[:email].collect { |detail| detail[:error] }.uniq == [:taken]
  end

  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
