FactoryBot.define do
  factory :message do
    sender_id 1
    receiver_id 1
    parent_id 1
    title "MyString"
    body "MyText"
  end
end
