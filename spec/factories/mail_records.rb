FactoryBot.define do
  factory :mail_record do
    recipient_id 1
    sender_id 1
    sent false
    body "MyText"
    subject "MyString"
    mail_type "MyString"
  end
end
