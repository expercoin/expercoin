FactoryBot.define do
  factory :category do
    name Faker::ProgrammingLanguage.name
    banner Faker::Lorem.paragraph

    trait :with_banner do
      remote_banner_url do
        Faker::Company.logo
      end
    end
  end
end
