class RequestChannel < ApplicationCable::Channel
  def subscribed
    stream_from "request_#{params[:room]}"
  end

  def unsubscribed; end
end
