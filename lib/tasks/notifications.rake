namespace :notifications do
  desc "Create test notifications"
  task create: :environment do
    Request.pending.each do |request|
      expert_id = request.expert.user.id
      Notifications::Create.new(
        user_id: expert_id,
        resource_type: 'Request',
        resource_id: request.id,
        type: 'new'
      ).perform
      puts "Created notification for request #{request.id}"
    end

    Request.accepted.each do |request|
      expert_id = request.expert.user.id
      Notifications::Create.new(
        user_id: expert_id,
        resource_type: 'Request',
        resource_id: request.id,
        type: 'accepted'
      ).perform
      puts "Created notification for request #{request.id}"
    end

    Message.unread.each do |message|
      user_id = message.sender.id
      Notifications::Create.new(
        user_id: user_id,
        resource_type: 'Message',
        resource_id: message.id,
        type: 'new'
      ).perform
      puts "Created notification for messsage #{message.id}"
    end
  end

end
