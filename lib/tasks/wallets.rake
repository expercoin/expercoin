namespace :wallets do
  desc "TODO"
  task create_test_wallets: :environment do
    rand(10..30).times do |index|
      profile = Profile.find_by(id: index)
      next unless profile
      wallet = profile.create_wallet
      rand(1..10).times do
        wallet.eth_addresses.create(
          public_key: "0x#{Faker::Crypto.sha1}"
        )
        wallet.eth_addresses.sample.update(default: true)
      end
    end
  end

end
