module Notifiable
  extend ActiveSupport::Concern

  def create_notification(type, resource_type)
    resource = resource_type.downcase
    Notifications::Create.new(
      user_id: send("#{resource}_user_id"),
      resource_type: resource_type,
      resource_id: instance_variable_get('@' << resource).id,
      type: type
    ).perform
  end

  private

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
