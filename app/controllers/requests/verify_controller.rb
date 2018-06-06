module Requests
  class VerifyController < ApplicationController
    before_action :authenticate_user!
    before_action :set_request
    before_action :set_address
    layout 'dashboard'

    def index
    end

    def create
      # @verify_request_service = VerifyRequestService.new(verify_params)
      # @verify_request_service.perform
      # return flash[:danger] = 'Validation failed' if @verify_request_service.request_verified?
      @request.verified! if verify_params[:tx_hash].match(/0x\w{30}/)
    end

    private

    def set_request
      @request = Request.find(params[:request_id])
    end

    def set_address
    end

    def verify_params
      params.require(:verify).permit(:tx_hash).merge(
        sender: current_user,
        request: @request
      )
    end
  end
end
