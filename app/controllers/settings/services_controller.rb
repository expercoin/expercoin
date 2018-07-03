# frozen_string_literal: true

module Settings
  class ServicesController < ApplicationController
    layout 'profile'
    before_action :authenticate_user!, except: [:show]
    before_action :set_profile

    def index
      @services = Service.where(owner: current_user)
    end

    private

    def set_profile
      @profile = current_user.profile
    end
  end
end
