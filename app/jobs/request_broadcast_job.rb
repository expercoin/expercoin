class RequestBroadcastJob < ApplicationJob
  queue_as :default

  def perform(request_id)
    Request.find(request_id).yield_self do |r|
      ActionCable.server.broadcast "request_#{r.id}", request: render_join_call(r)
    end
  end

  private

  def render_join_call(request)
    RequestsController.render partial: 'shared/msp/join_request_room', locals: { req: request }
  end
end
