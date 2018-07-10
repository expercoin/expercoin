module Notifications
  class Create
    def initialize(params)
      @params = params
      @user = User.find_by(id: params[:user_id])
    end

    def perform
      Notification.create!(
        title: title,
        content: content,
        user: @user,
        resource_type: resource_type,
        resource_id: resource_id
      )
    end

    private

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
