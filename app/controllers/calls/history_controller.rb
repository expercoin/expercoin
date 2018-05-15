module Calls
  class HistoryController < ApplicationController
    layout 'dashboard'

    def index
      requests = SearchRequestsService.new(
        current_user.profile.requests,
        params[:search]
      ).perform      
      @requests = requests.page(params[:page]).per(8)
    end
  end
end