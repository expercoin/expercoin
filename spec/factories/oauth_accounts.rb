# frozen_string_literal: true

FactoryBot.define do
  factory :oauth_account do
    user
    uid '12345'
    image_url Faker::Avatar.image
  end
end
