# frozen_string_literal: true

module Settings
  class AboutController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile
    before_action :set_specialization
    layout 'profile'

    def index
      @profile_form = ProfileForm.new(@profile)
    end

    def create
      @profile_form = ProfileForm.new(profile_params)
      @profile_form.update(@profile)
      redirect_to action: :index
    end

    private

    def profile_params
      params.require(:profile_form).permit(
        :about
      ).merge(specialization: specialization_params)
    end

    def set_profile
      @profile = current_user.profile
    end

    def set_specialization
      if @profile.specialization.length < 3
        @profile.update(
          specialization: { item_1: nil, item_2: nil, item_3: nil }
        )
      end
    end

    def specialization_params
      params.require(:profile_form).require(:specialization).permit(
        (1..20).to_a.map { |i| "item_#{i}" }
      )
    end
  end
end
