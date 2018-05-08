# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile

  def edit
    @profile_form = ProfileForm.new(@profile, photo_url: @profile.photo_url)
  end

  def show; end

  def update
    @profile_form = ProfileForm.new(profile_params)
    @profile_form.update(@profile)
    redirect_to edit_profile_path(@profile)
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
      :city
    )
  end

  def set_profile
    @profile = Profile.friendly.find(params[:id])
  end
end
