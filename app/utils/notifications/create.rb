module Notifications
  class Create
    def initialize(params)
      @params = params
      @user = User.find_by(id: params[:user_id])
    end

    def perform
      Notification.create(
        title: title,
        content: content,
        user: @user,
        resource_type: resource_type,
        resource_id: resource_id
      ).yield_self { |n| broadcast_notification(n) }
    end

    private

    def broadcast_notification(notification)
      NotificationBroadcastJob.perform_now(notification.id)
    end

    def resource_type
      @params[:resource_type]
    end

    def resource_id
      @params[:resource_id]
    end

    def type
      @params[:type]
    end

    def title
      I18n.t("notification.#{resource_type.downcase}.#{type}.title")
    end

    def content
      I18n.t("notification.#{resource_type.downcase}.#{type}.content")
    end
  end
end
