# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :authenticate_user!, except: [:show]
  before_action :set_profile
  layout 'profile', except: [:show]

  def edit
    @profile_form = ProfileForm.new(@profile, photo_url: @profile.photo_url)
    @categories = Category.children
    @help_people_find_you_tab = request.url.match('help-people-find-you')
    @about = request.url.match('about')
    @tab = 'basic_info'
    @tab = 'about' if @about
    @tab = 'help-people-find-you' if @help_people_find_you_tab
  end

  def show; 
    render action: 'show', layout: 'dashboard'
  end

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
