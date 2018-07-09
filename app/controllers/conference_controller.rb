class ConferenceController < ApplicationController
  before_action :authenticate_user!

  before_action :video

  layout 'dashboard'

  def create
    @request = Request.find_by_id(params[:request_id])
    return if user_not_valid?
    redirect_to conference_path(@request.room_sid) and return if room_exists?
    create_room
    update_members
    status_update
    redirect_to conference_path(@request.room_sid) if @request.inprogress?
  end

  def destroy
    @request = Request.find_by_room_sid(params[:id])
    return if user_not_valid?
    kill_room
    update_ended_at_if_not_completed
    status_update
    release_funds
    redirect_based_on_user
  end

  def show
    @request = Request.find_by_room_sid(params[:id])
    @request ||= Request.find_by_id(params[:request_id])
    @messages = @request.messages
    @expert = @request.expert
    raise ActionController::RoutingError.new('Not Found') if user_not_valid? || room_closed?
    @token = @video.access_token(
      current_user.email, params[:id]
    )
    @footer = true
    @expert_side = true if user_request_expert?
    update_members
    update_started_at
  end

  # def update
  #   @request = Request.find_by_room_sid(params[:id])
  # end

  private

  def update_members
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
    @video.kill_room(params[:id])
  end
  
  def status_update
    MSP::UpdateRequestStatus.new(@request).perform
  end

  def redirect_based_on_user
    redirect_to call_path(@request) if user_request_expert?
    redirect_to request_path(@request) if user_request_requester?
  end

  def create_room
    return unless valid_request_for_room_creation?
    sid = @video.create_room
    return unless sid
    @request.update(room_sid: sid)
  end

  def valid_request_for_room_creation?
    @request.verified?
  end

  def update_ended_at_if_not_completed
    return if @request.completed?
    @request.update(ended_at: Time.now, updated_by: current_user.profile)
  end

  def user_request_expert?
    @request.expert == current_user.profile
  end
  
  def user_request_requester?
    @request.requester == current_user.profile
  end

  def room_exists?
    @request.room_sid
  end

  def user_not_valid?
    !user_request_expert? && !user_request_requester?
  end

  def video
    @video = ::MSP::Conference::Video.new
  end

  def release_funds
    transaction = Transaction.find_by(receiver: @request.expert.user, request: @request)
    ReleaseFundsJob.perform_now(transaction) if @request.completed?
  end
end 
