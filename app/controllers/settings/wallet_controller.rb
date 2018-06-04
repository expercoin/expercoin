# frozen_string_literal: true

module Settings
  class WalletController < ApplicationController
    before_action :authenticate_user!
    before_action :set_profile
    before_action :set_wallet
    layout 'profile'

    def index; end

    def create
      @wallet.eth_addresses.create(eth_address_params)
    end

    def destroy
      eth_address = @wallet.eth_addresses.find(params[:id])
      eth_address.destroy
      set_wallet
    end

    private

    def eth_address_params
      params.require(:eth_address).permit(:public_key)
    end

    def set_profile
      @profile = current_user.profile
    end

    def set_wallet
      @wallet = @profile.wallet || @profile.create_wallet
    end
  end
end
