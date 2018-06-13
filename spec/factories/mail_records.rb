# frozen_string_literal: true

FactoryBot.define do
  factory :mail_record do
    recipient_id do
      User.first || create(:user, email: Faker::Internet.email)
      User.first.id
    end
    sender_id do
      User.second || create(:user, email: Faker::Internet.email)
      User.second.id
    end
    sent false
    body Faker::Lorem.paragraph(2, true, 20)
    subject 'Test mail'
    mail_type 'user_mailer'

    trait :sent do
      sent true
    end
  end
end
