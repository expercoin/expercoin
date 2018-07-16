class NotificationsController < ApplicationController
  layout 'dashboard'
  before_action :authenticate_user!

  def show
    notification = Notification.find(params[:id])
    if notification
      notification.update(status: 1)
      redirect_to redirection_path(notification)
    else
      not_found
    end
  end

  private

  def redirection_path(notification)
    resource = notification.resource
    resource_class = resource.class
    case resource_class.to_s
    when 'Request'
      if resource.requester?(current_user)
        request_path(resource)
      else
        call_path(resource)
      end
    when 'Message'
      inbox_path(resource)
    else
      not_found
    end
  end
end
