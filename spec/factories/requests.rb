# frozen_string_literal: true

FactoryBot.define do
  factory :request do
    title Faker::Movie.quote
    message Faker::OnePiece.quote
    requested_length { %w[15min 30min 45min].sample }
    cell_number Faker::PhoneNumber.cell_phone
    country_number 1
    first_date Faker::Time.forward(23, :morning).to_date
    second_date Faker::Time.forward(25, :day).to_date
    third_date Faker::Time.forward(28, :evening).to_date
    first_time Faker::Time.forward(23, :morning).to_time.strftime('%I:%M %p')
    second_time Faker::Time.forward(25, :day).to_time.strftime('%I:%M %p')
    third_time Faker::Time.forward(28, :evening).to_time.strftime('%I:%M %p')
    status 'pending'
    time_zone 'Eastern Time (US & Canada)'
    association :requester, factory: :profile, first_name: Faker::Name.first_name
    association :expert, factory: :profile, last_name: Faker::Name.last_name
    updated_by { requester }

    trait :completed do
      status 'completed'
      started_at { "#{first_date} #{first_time}".to_datetime }
      ended_at { "#{first_date} #{first_time}".to_datetime + requested_length.to_i.minutes }
    end

    trait :accepted do
      status 'accepted'
      selected_date { first_date }
    end

    trait :verifying do
      status 'verifying'
      tx_hash "0x#{Faker::Crypto.sha256}"
    end

    trait :verified do
      status 'verified'
      eth_transactions { [create(:transaction, sender: requester.user)] }
    end

    trait :verified do
      status 'verified'
      eth_transactions { [create(:transaction, sender: requester.user)] }
    end

    trait :inprogress do
      status 'inprogress'
      invitee true
      started_at { "#{first_date} #{first_time}".to_datetime }
    end
  end
end
