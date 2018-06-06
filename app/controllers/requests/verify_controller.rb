module Requests
  class VerifyController < ApplicationController
    before_action :authenticate_user!
    before_action :set_request
    before_action :set_address
    layout 'dashboard'

    def index
    end

    def create; end

    private

    def set_request
      @request = Request.find(params[:request_id])
    end

    def set_address
      wallet = @request.requester.wallet
      @address = wallet.eth_addresses.find_by(default: true) || wallet.eth_addresses.last
    end
  end
end
