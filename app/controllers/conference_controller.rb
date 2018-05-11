class ConferenceController < ApplicationController
  before_action :authenticate_user!

  before_action :video

  layout 'dashboard'

  # def index
  # end

  def create
    @request = Request.find_by_id(params[:request_id])
    return if request_not_valid?
    sid = @video.create_room
    if sid
      @request.update(room_sid: sid, started_at: Time.now)
      redirect_to conference_path(sid)
    end
  end

  def destroy
    @request = Request.find_by_room_sid(params[:id])
    @video.kill_room(params[:id])
    @request.update(updated_by: current_user.profile, status: 'completed', ended_at: Time.now)
    redirect_to '/calls' if user_request_expert?
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
  end

  private
  
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
