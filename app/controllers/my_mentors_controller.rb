class MyMentorsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!
  before_action :set_my_mentors

  def index; end

  private

  def set_my_mentors
    requests = Request.where(requester: current_user).order(created_at: :desc)
    @mentors = requests.map(&:expert).uniq
  end
end
