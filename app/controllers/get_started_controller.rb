class GetStartedController < ApplicationController
  before_action :authenticate_user!

  layout 'get_started'

  def index

  end  
end  