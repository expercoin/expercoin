module Requests
  class TimesController < ApplicationController
    include Notifiable

    layout 'dashboard'
    before_action :authenticate_user!
    before_action :set_request

    def edit
      @expert = @request.expert
    end

    def update
      return render :show unless @request.update(request_params)
      MSP::Email::Request.new(@request).email_to_expert
      create_notification(@request.accepted? ? 'accepted' : 'time_change', 'Request')
      redirect_to request_path(@request)
    end

    private

    def request_params
      params.require(:request).permit(
        :first_time,
        :first_date,
        :second_time,
        :second_date,
        :third_time,
        :third_date,
        :selected_date
      ).merge(
        updated_by: current_user.profile,
        status: "#{params[:request][:selected_date] ? 'accepted' : 'pending'}"
      )
    end

    def set_request
      @request = current_user.profile.created_requests.find_by_id(params[:id])
    end
  end
end
