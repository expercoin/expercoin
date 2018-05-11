module Requests
  class TimesController < ApplicationController
    layout 'dashboard'
    before_action :authenticate_user!
    before_action :set_request

    def edit
      @expert = @request.expert
    end

    def update
      return render :show unless @request.update(request_params)
      MSP::Email::Request.new(@request).email_to_expert
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
        :selected_date,
        :status
      ).merge(updated_by: current_user.profile)
    end

    def set_request
      @request = current_user.profile.created_requests.find_by_id(params[:id])
    end

    def render_error_messages(action)
      @profile = @request.expert
      flash.now[:alert] = @request.errors.full_messages.join(', ')
      render action
    end
  end
end
