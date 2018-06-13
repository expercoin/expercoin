# frozen_string_literal: true

FactoryBot.define do
  factory :review do
    message Faker::MostInterestingManInTheWorld.quote
    rate Faker::Number.between(1, 5)
    request
    author { request.requester }
    profile { request.expert }
  end
end
