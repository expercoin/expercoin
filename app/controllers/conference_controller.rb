class ConferenceController < ApplicationController
  
  before_action :video

  layout 'dashboard'

  def index
  end

  def create
    sid = @video.create_room('request_id')
    if sid
      redirect_to conference_path(sid)
    end
  end

  def destroy
    @video.kill_room(params[:id])
    redirect_to conference_index_path
  end

  def show
    # @account = current_user.company_corporate
    @request = Request.last
    @expert = @request.expert

    @token = @video.access_token(
      current_user.email, params[:id]
    )
    @footer = true
  end

  private
  
  def video
    @video = ::MSP::Conference::Video.new
  end

end 
