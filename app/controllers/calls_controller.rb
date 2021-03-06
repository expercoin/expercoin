class CallsController < ApplicationController
  include Notifiable

  before_action :authenticate_user!
  before_action :set_request_and_expert, except: [:index]
  layout 'dashboard'

  def index
    requests = SearchService.new(
      current_user.profile.requests,
      params[:search]
    ).perform
    @requests = requests.page(params[:page]).per(8)
  end

  def show
    @request = current_user.profile.requests.find(params[:id])
    @room_sid = @request.room_sid
    @review = Review.find_by(request: @request, author: current_user.profile)
    render :edit if not_selected_session_time
  end

  def update
    return render :show unless @request.update(request_params)
    MSP::Email::Request.new(@request).email_to_requester
    create_notification(@request.accepted? ? 'accepted' : 'time_change', 'Request')
    redirect_to calls_path
  end

  def reject
    @request.update(status: 'rejected')
    create_notification('rejected', 'Request')
    redirect_to calls_path
  end

  private

  def request_params
    params.require(:request).permit(request_attributes).merge(
      updated_by: current_user.profile,
      status: "#{params[:request][:selected_date] ? 'accepted' : 'pending'}"
    )
  end

  def request_attributes
    %i[
      title message category_id tag_list requested_length cell_number
      country_number first_date second_date third_date first_time
      second_time third_time expert_id recording selected_date time_zone
    ]
  end

  def set_request_and_expert
    @request = current_user.profile.requests.find_by_id(params[:id])
    @profile = @request.requester
  end

  def not_selected_session_time
    @request.pending? && @request.updated_by == @request.requester
  end
end
