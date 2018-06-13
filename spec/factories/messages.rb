# frozen_string_literal: true

FactoryBot.define do
  factory :message do
    title Faker::Hacker.say_something_smart
    body Faker::Lorem.paragraph(2, true, 20)

    sender do
      User.first || create(:user, email: 'sender@message.com')
    end

    receiver do
      User.second || create(:user, email: 'receiver@message.com')
    end

    trait :with_parent do
      parent { create(:message) }
    end
  end
end
