namespace :wallets do
  desc "TODO"
  task create_test_wallets: :environment do
    profiles = Profile.all
    profiles.each do |profile|
      wallet = profile.create_wallet
      rand(1..10).times do
        wallet.eth_addresses.create(
          public_key: "0x#{Faker::Crypto.sha1}",
          default: false
        )
        wallet.eth_addresses.sample.update(default: true)
      end
    end
  end

end
