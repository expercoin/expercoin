class ConferenceService
  include Rails.application.routes.url_helpers

  def initialize(request, user)
    @request = request
    @user = user
    @video = video
    not_found_expecation if user_not_valid?
  end

  def create
    return conference_path(@request.room_sid) if room_exists?
    create_room
    update_members
    status_update
    conference_path(@request.room_sid) if @request.inprogress?
  end

  def destroy
    kill_room
    update_ended_at_if_not_completed
    status_update
    release_funds
    path_based_on_user
  end

  def raise_error_if_room_closed
    not_found_expecation if room_closed?
  end

  def visit_setup
    update_members
    update_started_at
  end

  def token
    @token = @video.access_token(
      @user.email, @request.room_sid
    )
  end

  private

  def not_found_expecation
    raise ActionController::RoutingError.new('Not Found')
  end

  def update_members
    return unless @request.room_sid
    @request.update(invitee: true) if user_request_expert?
    @request.update(inviter: true) if user_request_requester?
  end

  def update_started_at
    return unless update_started_at?
    @request.update(started_at: Time.now)
  end

  def update_started_at?
    @request.members_present? && @request.started_at.blank?
  end

  def room_closed?
    @video.room_closed?(@request.room_sid)
  end

  def kill_room
    @video.kill_room(@request.room_sid)
  end

  def status_update
    MSP::UpdateRequestStatus.new(@request).perform
  end

  def path_based_on_user
    return call_path(@request) if user_request_expert?
    request_path(@request) if user_request_requester?
  end

  def create_room
    return unless valid_request_for_room_creation?
    sid = @video.create_room
    return unless sid
    @request.update(room_sid: sid)
  end

  def valid_request_for_room_creation?
    @request.verified? && time_in_range
  end

  def time_in_range
    DatetimeValidator.new(
      Time.now,
      {
        start_date: @request.selected_date,
        end_date: @request.selected_date + @request.requested_length_in_minutes
      }
    ).in_range
  end

  def update_ended_at_if_not_completed
    return if @request.completed?
    @request.update(ended_at: Time.now, updated_by: @user.profile)
  end

  def user_request_expert?
    @request.expert == @user.profile
  end

  def user_request_requester?
    @request.requester == @user.profile
  end

  def room_exists?
    @request.room_sid
  end

  def user_not_valid?
    !user_request_expert? && !user_request_requester?
  end

  def video
    ::MSP::Conference::Video.new
  end

  def release_funds
    # transaction = Transaction.find_by(receiver: @request.expert.user, request: @request)
    # ReleaseFundsJob.perform_now(transaction) if @request.completed?
  end
end
