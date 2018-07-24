# frozen_string_literal: true

FactoryBot.define do
  factory :page do
    url Faker::Internet.url

    trait :with_default_options do
      name Faker::Internet.domain_word
      title Faker::Internet.domain_suffix
      description Faker::Lorem.paragraph
      keywords Faker::Commerce.department
    end

    trait :service do
      with_default_options
      content { create(:service) }
      url { "/offerings/#{content.slug}" }
    end
  end
end
