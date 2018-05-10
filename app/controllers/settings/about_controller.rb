# frozen_string_literal: true

module Settings
  class AboutController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile
    layout 'profile'

    def index
      @profile_form = ProfileForm.new(@profile)
    end

    def create
    end

    private

    def profile_params
      params.require(:profile_form).permit(
      )
    end

    def set_profile
      @profile = current_user.profile
    end
  end
end
