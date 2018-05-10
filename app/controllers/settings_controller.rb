class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  layout 'profile'

  def index
    @profile_form = ProfileForm.new(@profile, @profile.location, photo_url: @profile.try(:photo).thumb.url)
  end

  def create
    @profile_form = ProfileForm.new(profile_params)
    @profile_form.update(@profile)
    redirect_to action: :index
  end

  private

  def profile_params
    params.require(:profile_form).permit(
      :first_name,
      :last_name,
      :name,
      :title,
      :years_of_experience,
      :photo,
      :rate,
      :expercoin_rate,
      :address,
      :country,
      :state,
      :city,
      :zip_code
    )
  end

  def set_profile
    @profile = current_user.profile
  end
end
