module Calls
  class HistoryController < ApplicationController
    layout 'dashboard'

    def index
      requests = SearchService.new(
        current_user.profile.requests.completed,
        params[:search]
      ).perform
      @requests = requests.page(params[:page]).per(8)
    end
  end
end
