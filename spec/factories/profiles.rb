# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    rate { rand }
    expercoin_rate { rate * 1.07 }
    title Faker::Job.title
    about Faker::Lorem.paragraph(2, true, 50)
    address Faker::Address.street_address
    state Faker::Address.state
    country 'United States'
    city Faker::Address.city
    zip_code Faker::Address.zip_code
    user do
      create(:user, email: Faker::Internet.email)
    end

    trait :with_photo do
      remote_photo_url Faker::Avatar.image
    end

    after(:create) do |profile|
      wallet = create(:wallet, profile: profile)
      create(:eth_address, wallet: wallet)
    end
  end
end
