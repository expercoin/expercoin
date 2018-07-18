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

    trait :pending do
      status 'pending'
    end

    trait :accepted do
      pending
      status 'accepted'
      selected_date { sugested_times.first.formated_datetime }
      requested_amount_eth 0.015
    end

    trait :verifying do
      accepted
      status 'verifying'
      tx_hash "0x#{Faker::Crypto.sha256}"
    end

    trait :verified do
      verifying
      status 'verified'
      eth_transactions { [create(:transaction, sender: requester.user, tx_hash: "0x#{Faker::Crypto.sha256}")] }
    end

    trait :inprogress do
      verified
      status 'inprogress'
      invitee true
      room_sid 'RMe1491f9d09795f0ee843879b8eb92c17'
      started_at { "#{first_date} #{first_time}".to_datetime }
      ended_at nil
    end

    trait :completed do
      inprogress
      status 'completed'
      started_at { "#{first_date} #{first_time}".to_datetime }
      ended_at { "#{first_date} #{first_time}".to_datetime + requested_length.to_i.minutes }
    end

    trait :unscheduled do
      first_date nil
      second_date nil
      third_date nil
    end

    trait :selected_time_ten_minutes_ago do
      time_zone 'Sarajevo'
      first_date { (Time.now - 10.minutes).to_date }
      first_time { (Time.now - 10.minutes).to_time.strftime('%I:%M %p') }
      inprogress
    end

    trait :selected_time_ten_minutes_from_now do
      time_zone 'Sarajevo'
      first_date { (Time.now + 10.minutes).to_date }
      first_time { (Time.now + 10.minutes).to_time.strftime('%I:%M %p') }
      inprogress
    end
  end
end
