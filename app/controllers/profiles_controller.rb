# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]
  layout 'dashboard'

  def show
    @profile_services = @profile.services.page(params[:page])
    render action: 'show', layout: 'dashboard'
  end

  def index
    @profiles = Profile.all.page(params[:page]).per(9)
    @categories = Category.main
  end

  private

  def set_profile
    @profile = Profile.friendly.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to profiles_path, flash: { error: 'Profile Not Found' }
  end
end
