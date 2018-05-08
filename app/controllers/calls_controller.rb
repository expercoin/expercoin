class CallsController < ApplicationController
  before_action :authenticate_user!

  def index
    @history = request.url.match('history')
  end
end