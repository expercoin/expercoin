module Notifiable
  extend ActiveSupport::Concern

  def create_request_notification(type)
    Notifications::Create.new(
      user_id: notification_request_user_id,
      resource_type: 'Request',
      resource_id: @request.id,
      type: type
    ).perform
  end

  def create_message_notification(type)
    Notifications::Create.new(
      user_id: receiver_id,
      resource_type: 'Message',
      resource_id: @message.id,
      type: type
    ).perform
  end

  private

  def notification_request_user_id
    current_user.profile == @request.expert ? requester_user_id : expert_user_id
  end

  def expert_user_id
    @request.expert.user.id
  end

  def requester_user_id
    @request.requester.user.id
  end

  def receiver_id
    @message.receiver.id
  end
end
