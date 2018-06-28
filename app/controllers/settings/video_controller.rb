# frozen_string_literal: true

module Settings
  class VideoController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile
    layout 'profile'

    def index
      @profile_form = ProfileForm.new(@profile)
    end

    def create
      @profile_form = ProfileForm.new(profile_params)
      @profile_form.update(@profile)
    end

    private

    def profile_params
      params.require(:profile_form).permit(:video_url)
    end

    def set_profile
      @profile = current_user.profile
    end
  end
end
