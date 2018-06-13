# frozen_string_literal: true

FactoryBot.define do
  factory :eth_address do
    public_key "0x#{Faker::Crypto.sha1}"
    default false
    wallet

    trait :default do
      default true
    end
  end
end
