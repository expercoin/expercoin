class MyMentorsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  before_action :set_my_mentors

  def index; end

  private

  def set_my_mentors
    requests = Request.where(requester: current_user)
    @mentors = requests.map(&:expert)
  end
end
