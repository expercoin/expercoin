module Calls
  class HistoryController < ApplicationController
    layout 'dashboard'

    def index
      ordered_requests = current_user.profile.requests.order(created_at: :desc)
      @requests = ordered_requests.page(params[:page]).per(8)
    end
  end
end