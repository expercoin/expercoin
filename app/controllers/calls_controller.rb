class CallsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_request_and_expert, only: %i[show edit update]
  layout 'dashboard'

  def index
    @requests = current_user.profile.requests.page(params[:page]).per(8)
    @history = request.url.match('history')
  end

  def show
    @request = current_user.profile.requests.find(params[:id])
  end

  def update
    return render :edit unless @request.update(request_params)
    @request.update_status
    redirect_to :index
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
    @request = current_user.profile.requests.find_by_id(params[:id])
    @profile = @request.expert
  end

end