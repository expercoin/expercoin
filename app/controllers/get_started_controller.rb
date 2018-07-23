class GetStartedController < ApplicationController
  before_action :authenticate_user!

  layout 'get_started'

  def index
    @popular_tags = ActsAsTaggableOn::Tag.most_used.last(5)
  end
end
