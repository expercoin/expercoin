# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    tx_hash '0xe1b91f4418cefb8449b741285f8f59efc1b52ae08c5aac1dd63e293babef8539'
    block_number "0x#{Faker::Number.hexadecimal(3)}"
    to_eth { ENV['ETH_ADDRESS'] }
    status 'completed'
    request
    sender { request.requester.user }
    from_eth do
      wallet = sender.profile.wallet || create(:wallet, profile: sender.profile)
      create(:eth_address, wallet: wallet).public_key
    end
    eth_amount do
      0.00836774199713779
    end
  end
end
