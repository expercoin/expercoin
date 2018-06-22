# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    tx_hash "0x#{Faker::Crypto.sha256}"
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
      rate = request.expert.expercoin_rate
      length = request.requested_length.to_i
      (rate * length).to_f.round(18)
    end
  end
end
