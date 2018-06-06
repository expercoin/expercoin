module Requests
  class VerifyController < ApplicationController
    before_action :authenticate_user!
    before_action :set_request

    def index
    end

    def create; end

    private

    def set_request
      @request = Request.find(params[:request_id])
    end
  end
end
