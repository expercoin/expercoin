namespace :payments do
  desc 'Create test payments'
  task create_test_payments: :environment do
    requests = Request.completed
    requests.each do |request|
      amount = rand
      cost = amount.to_f * 0.0008
      transaction = Transaction.create!(
        sender: request.requester.user,
        tx_hash: "0x#{Faker::Bitcoin.testnet_address}",
        status: 'success',
        eth_address: request.requester.wallet.eth_addresses.sample,
        eth_amount: amount,
        usd_amount: amount * 550,
        tx_cost: cost,
      )
      puts "Payment with sender #{request.requester.first_name} #{request.requester.last_name} created"
    end
  end
end
