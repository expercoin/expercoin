# frozen_string_literal: true

FactoryBot.define do
  factory :transaction do
    tx_hash "0x#{Faker::Crypto.sha256}"
    block_number "0x#{Faker::Number.hexadecimal(3)}"
    to_eth '0xbfdbbA3223F3ec256eddE4916BdF343725481CFA'

    request
    sender { request.requester.user }
    from_eth do
      wallet = sender.profile.wallet || create(:wallet, profile: sender.profile)
      create(:eth_address, wallet: wallet).public_key
    end
    eth_amount { rand }
  end
end
