class RequestsController < ApplicationController

  layout 'dashboard'
  before_action :authenticate_user!
  before_action :set_profile, only: %i[new]
  before_action :set_request_and_expert, only: %i[show edit update]

  def index
    @requests = current_user.profile.requests.page(params[:page]).per(8)
  end

  def show
  end

  def thankyou; end

  def new
    @request = Request.new(requester: current_user&.profile, expert: @profile)
  end

  def edit; end

  def update
    return render :edit unless @request.update(request_params)
    render :thankyou
  end

  def create
    @request = Request.new(
      request_params.merge(requester: current_user&.profile, status: 0)
    )
    return render_error_messages :new unless @request.save
    redirect_to edit_request_path(@request.id)
  end

  private

  def set_profile
    @profile = Profile.friendly.find(params[:expert])
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
    @request = Request.find_by_id(params[:id])
    @profile = @request.expert
  end

  def render_error_messages(action)
    @profile = @request.expert
    flash.now[:alert] = @request.errors.full_messages.join(', ')
    render action
  end
end