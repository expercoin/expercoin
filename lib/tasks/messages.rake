namespace :messages do
  desc "Create test messages"
  task create_test_messages: :environment do
    60.times do
      sender = User.all.sample
      receiver = User.all.sample
      next if sender == receiver
      Message.create!(
        sender: sender,
        receiver: receiver,
        title: Faker::Hacker.say_something_smart,
        body: Faker::Lorem.paragraph(2, true, 20)
      )
    end
  end

  desc "Create test messages with parent"
  task create_test_parent_messages: :environment do
    parents = Message.where(parent: nil).sample(40)
    parents.each do |parent|
      receiver = parent.sender
      sender = parent.receiver
      Message.create!(
        sender: sender,
        receiver: receiver,
        parent: parent,
        title: parent.title,
        body: Faker::Lorem.paragraph(2, true, 20)
      )
    end
  end

end
