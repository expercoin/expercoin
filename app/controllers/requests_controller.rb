class RequestsController < ApplicationController
  before_action :set_request_and_expert, only: %i[show edit update]

  layout 'corporate/application'

  def index
    @requests = current_user.profile.requests.page(params[:page]).per(8)
  end

  def show
    @category = Category.find_by(id: @request.category_id)
  end

  def thankyou; end

  def new
    @request = ::MSP::Request.new(requester: current_user, expert: @expert)
    @categories = Category.all.map { |c| [c.name, c.id] }
  end

  def edit; end

  def update
    return render :edit unless @request.update(request_params)
    MSP::Email::Request.new(@request).email_to_expert
    render :thankyou
  end

  def create
    @request = Request.new(
      request_params.merge(requester: current_user&.profile, status: 0)
    )
    if !@request.save
      render_error_messages
      redirect_to expert_precall_index_path(@expert)
    else
      redirect_to request_path(@request)
    end
  end

  private

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

  def set_request_and_expert
    @request = Request.find_by_id(params[:id])
    @expert = @request.expert
  end

  def render_error_messages
    @expert = @request.expert
    flash.now[:alert] = @request.errors.full_messages.join(', ')
  end
end