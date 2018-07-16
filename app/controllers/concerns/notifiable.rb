module Notifiable
  extend ActiveSupport::Concern

  def create_notification(type, resource_type)
    Notifications::Create.new(notification_params(type, resource_type)).perform
  end

  def create_delayed_notification(date, type, resource_type)
    return unless from_now_positive?(date)
    CreateNotificationJob.set(wait: from_now(date))
                         .perform_now(resource_type, notification_params(type, resource_type))
  end

  private

  def from_now_positive?(date)
    from_now(date).positive?
  end

  def from_now(date)
    date.utc - Time.now.utc
  end

  def notification_params(type, resource_type)
    resource = resource_type.downcase
    {
      user_id: send("#{resource}_user_id"),
      resource_type: resource_type,
      resource_id: instance_variable_get('@' << resource).id,
      type: type
    }
  end

  def request_user_id
    current_user.profile == @request.expert ? requester_user_id : expert_user_id
  end

  def expert_user_id
    @request.expert.user.id
  end

  def requester_user_id
    @request.requester.user.id
  end

  def message_user_id
    @message.receiver.id
  end
end
