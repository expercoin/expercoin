class RequestsController < ApplicationController

  layout 'dashboard'
  before_action :authenticate_user!
  before_action :set_profile, only: %i[new]
  before_action :set_request_and_expert, only: %i[show update]
  before_action :redirect_to_verify
  before_action :set_service, only: %i[new]

  def index
    requests = SearchService.new(
      current_user.profile.created_requests,
      params[:search]
    ).perform
    @requests = requests.page(params[:page]).per(8)
  end

  def show
    @room_sid = @request.room_sid
    @service = @request.service
  end

  def thankyou; end

  def new
    @request = Request.new(
      requester: current_user&.profile,
      expert: @profile,
      service: @service,
      title: @service&.title
    )
  end

  def edit
    @request = current_user.profile.created_requests.draft.find(params[:id])
    @service = @request.service
    @profile = @request.expert
  end

  def update
    return render :edit unless @request.update(request_params)
    MSP::UpdateRequestStatus.new(@request).perform
    MSP::Email::Request.new(@request).email_to_expert_new_request
  end

  def create
    @request = Request.new(
      request_params.merge(requester: current_user&.profile, status: 0)
    )
    return render_error_messages :new unless @request.save
    create_new_request_notification
    redirect_to edit_request_path(@request.id)
  end

  private
  
  def create_new_request_notification
    Notifications::Create.new(
      user_id: @request.expert.user_id,
      resource_type: @request.class.name,
      resource_id: @request.id,
      type: :new
    ).perform
  end

  def redirect_to_verify
    redirect_to request_verify_index_path(@request) if @request&.accepted?
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
      service_id
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

  def set_service
    @service = Service.find_by_slug(params[:service])
  end

  def render_error_messages(action)
    @profile = @request.expert
    flash.now[:alert] = @request.errors.full_messages.join(', ')
    render action
  end
end
