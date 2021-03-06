# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    password Faker::Internet.password
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    confirmed_at Time.zone.now
    first_time false

    trait :no_email do
      email ''
    end

    trait :no_password do
      password ''
    end

    trait :no_first_name do
      first_name ''
    end

    trait :no_last_name do
      last_name ''
    end

    trait :first_time do
      first_time true
    end

    trait :verified do
      status 'verified'
    end

    trait :unconfirmed do
      confirmed_at nil
    end
  end
end
