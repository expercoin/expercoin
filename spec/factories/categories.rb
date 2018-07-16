# frozen_string_literal: true

FactoryBot.define do
  factory :category do
    name Faker::ProgrammingLanguage.name
    banner Faker::Lorem.paragraph

    trait :with_banner do
      remote_banner_url do
        Faker::Company.logo
      end
    end

    trait :with_parent do
      parent { create(:category) }
    end
  end
end
