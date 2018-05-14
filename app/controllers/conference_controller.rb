class ConferenceController < ApplicationController
  before_action :authenticate_user!

  before_action :video

  layout 'dashboard'

  # def index
  # end

  def create
    @request = Request.find_by_id(params[:request_id])
    return if request_not_valid?
    create_room
    MSP::UpdateRequestStatus.new(@request).perform
    redirect_to conference_path(@request.room_sid) if @request.inprogress?
  end

  def destroy
    @request = Request.find_by_room_sid(params[:id])
    @video.kill_room(params[:id])
    update_ended_at_if_not_completed
    MSP::UpdateRequestStatus.new(@request).perform
    redirect_to calls_path if user_request_expert?
    redirect_to requests_path if user_request_requester?
  end

  def show
    @request = Request.find_by_room_sid(params[:id])
    @request ||= Request.find_by_id(params[:request_id])
    @expert = @request.expert
    return if user_not_valid?
    @token = @video.access_token(
      current_user.email, params[:id]
    )
    @footer = true
    @expert_side = true if user_request_expert? 
  end

  private
  
  def create_room
    return unless valid_request_for_room_creation?
    sid = @video.create_room
    return unless sid
    @request.update(room_sid: sid, started_at: Time.now)
  end

  def valid_request_for_room_creation?
    @request.accepted?
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

  def request_not_valid?
    !@request.accepted?
  end

  def user_not_valid?
    !user_request_expert? && !user_request_requester?
  end

  def video
    @video = ::MSP::Conference::Video.new
  end

end 
