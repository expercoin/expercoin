# frozen_string_literal: true

class ProfilesController < ApplicationController
  before_action :set_profile
  layout 'profile', except: [:show]

  def show; 
    render action: 'show', layout: 'dashboard'
  end

  private

  def set_profile
    @profile = Profile.friendly.find(params[:id])
  end
end
