class RequestsController < ApplicationController

  layout 'dashboard'
  before_action :authenticate_user!
  before_action :set_profile, only: %i[new]
  before_action :set_request_and_expert, only: %i[show update]

  def index
    requests = SearchRequestsService.new(
      current_user.profile.created_requests,
      params[:search]
    ).perform
    @requests = requests.page(params[:page]).per(8)
  end

  def show
    @room_sid = @request.room_sid
  end

  def thankyou; end

  def new
    @request = Request.new(requester: current_user&.profile, expert: @profile)
  end

  def edit
    @request = current_user.profile.created_requests.draft.find(params[:id])
    @profile = @request.expert
  end

  def update
    return render :edit unless @request.update(request_params)
    MSP::UpdateRequestStatus.new(@request).perform
    MSP::Email::Request.new(@request).email_to_expert_new_request
    redirect_to requests_path
  end

  def create
    @request = Request.new(
      request_params.merge(requester: current_user&.profile, status: 0)
    )
    return render_error_messages :new unless @request.save
    redirect_to edit_request_path(@request.id)
  end

  private

  def searched
    return if params[:search].blank?
    return current_user.profile.created_requests.pg_search(params[:search]) if Rails.env.production?
    current_user.profile.created_requests.where(
      "title LIKE ? OR message LIKE ?",
      "%#{params[:filter]}%", "%#{params[:filter]}%"
      ).order(created_at: :desc)
  end

  def ordered
    current_user.profile.created_requests.order(created_at: :desc)
  end

  def request_params
    params.require(:request).permit(request_attributes)
          .merge(updated_by: current_user.profile)
  end

  def request_attributes
    %i[
      title message category_id tag_list requested_length cell_number
      country_number first_date second_date third_date first_time
      second_time third_time expert_id recording selected_date time_zone
    ]
  end
  
  def set_profile
    @profile = Profile.friendly.find(params[:expert])
    return if @profile
    redirect_to root_path
  end

  def set_request_and_expert
    @request = current_user.profile.created_requests.find_by_id(params[:id])
    @profile = @request.expert
  end

  def render_error_messages(action)
    @profile = @request.expert
    flash.now[:alert] = @request.errors.full_messages.join(', ')
    render action
  end
end
