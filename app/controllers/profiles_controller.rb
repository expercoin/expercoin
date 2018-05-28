# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile, only: [:show]
  layout 'dashboard'

  def show
    render action: 'show', layout: 'dashboard'
  end

  def index
    @profiles = Profile.all.page(params[:page]).per(9)
    @categories = Category.main
  end

  private

  def set_profile
    @profile = Profile.friendly.find(params[:id])
  end
end
