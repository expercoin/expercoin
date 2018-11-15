class ConferenceController < ApplicationController
  before_action :authenticate_user!

  layout 'dashboard'

  def create
    @request = Request.find_by_id(params[:request_id])
    path = ConferenceService.new(@request, current_user).create
    redirect_to path
  end

  def destroy
    @request = Request.find_by_room_sid(params[:id])
    path = ConferenceService.new(@request, current_user).destroy
    redirect_to path
  end

  def update
    @request = Request.find_by_room_sid(params[:id])
  end

  def show
    @request = Request.find_by_room_sid(params[:id])
    @request ||= Request.find_by_id(params[:request_id])
    set_view_instance
    conference_service = ConferenceService.new(@request, current_user)
    conference_service.raise_error_if_room_closed
    @token = conference_service.token
    conference_service.visit_setup
  end

  private

  def set_view_instance
    @messages = @request.messages
    @expert = @request.expert
    @footer = true
    @expert_side = true if @request.expert == current_user.profile
  end
end
