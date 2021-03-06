module Requests
  class VerifyController < ApplicationController
    include Notifiable
    include DecoratorHelper

    before_action :authenticate_user!
    before_action :set_request
    before_action :set_address
    before_action :raise_error_if_request_not_accepted
    layout 'dashboard'

    def index
      @addresses = current_user&.profile&.wallet&.eth_addresses
      @request.update(requested_amount_eth: decorate(@request).amount)
      @eth_amount = @request.requested_amount_eth
      @usd_amount = decorate(@request).usd_amount
      @expert_account = helpers.decorate(@request).expert_address
    end

    def create
      @verify_request_service = VerifyRequestService.new(verify_params)
      @verify_request_service.perform
      create_request_notifications
      redirect_to request_path(@request) if @verify_request_service.request_verified? || @verify_request_service.pending?
      @error_message = @verify_request_service.error_message
    end

    private

    def create_request_notifications
      return unless @request.verified?
      create_notification('verified', 'Request')
      create_delayed_notification(
        @request.requester.user_id,
        @request.selected_date - 5.minutes,
        'call_soon',
        'Request'
      )
      create_delayed_notification(
        @request.expert.user_id,
        @request.selected_date - 5.minutes,
        'call_soon',
        'Request'
      )
    end

    def raise_error_if_request_not_accepted
      raise ActionController::RoutingError.new('Not Found') unless @request.accepted?
    end

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
