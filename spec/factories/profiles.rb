# frozen_string_literal: true

FactoryBot.define do
  factory :profile do
    first_name Faker::Name.first_name
    last_name Faker::Name.last_name
    rate { Eth::ValueFormatter.new(rand).to_hex }
    expercoin_rate { Eth::ValueFormatter.new(rand).to_hex }
    title Faker::Job.title
    about Faker::Lorem.paragraph(2, true, 50)
    address Faker::Address.street_address
    state Faker::Address.state
    country 'United States'
    city Faker::Address.city
    zip_code Faker::Address.zip_code
    # remote_photo_url Faker::Avatar.image
    # specialization specialization
    user
  end
end
