class GetStartedController < ApplicationController
  before_action :authenticate_user!

  layout 'get-started'

  def index

  end  
end  