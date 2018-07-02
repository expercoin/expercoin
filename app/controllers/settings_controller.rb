class SettingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile
  layout 'profile'

  def index
    set_profile_form
  end

  def create
    profile_form = ProfileForm.new(profile_params)
    profile_form.update(@profile)
    set_profile_form
  end

  def states
    @states= CitiesAndStatesFromCountry.new(profile_params[:country]).states
  end

  def cities
    @cities= CitiesAndStatesFromCountry.new(profile_params[:country], profile_params[:state]).cities
  end

  private

  def set_profile_form
    @profile_form = ProfileForm.new(@profile, @profile.location, photo_url: @profile.try(:photo).thumb.url)
  end

  def profile_params
    params.require(:profile_form).permit(
      :first_name,
      :last_name,
      :name,
      :title,
      :years_of_experience,
      :photo,
      :expercoin_rate,
      :address,
      :country,
      :state,
      :city,
      :zip_code,
      :rate
    )
  end

  def set_profile
    @profile = current_user.profile
  end
end
