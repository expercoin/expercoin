# frozen_string_literal: true

module Settings
  class AddressesController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile
    layout 'profile'

    def index
      @addresses = @profile.eth_addresses
    end

    def create
      @profile_form = ProfileForm.new(profile_params)
      @profile_form.create_eth_address(@profile)
      redirect_to action: :index
    end

    def destroy
      address = params[:id]
      @profile.eth_addresses.delete(address)
      @profile.save
      redirect_to action: :index
    end

    private

    def profile_params
      params.require(:profile_form).permit(:eth_address)
    end

    def set_profile
      @profile = current_user.profile
    end
  end
end
