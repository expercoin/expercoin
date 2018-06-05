namespace :payments do
  desc 'Create test payments'
  task create_test_payments: :environment do
    requests = Request.completed
    requests.each do |request|
      requester = request.requester
      expert = request.expert
      rate = requester.expercoin_rate
      length = request.ended_at - request.started_at
      length = Time.at(length).strftime('%M').to_i
      amount = rate * length
      cost = amount.to_f * 0.0008
      transaction = Transaction.create!(
        sender: requester,
        receiver: expert,
        token: "0x#{Faker::Bitcoin.testnet_address}",
        status: 'success',
        from_eth: requester.wallet.eth_addresses.sample,
        to_eth: expert.wallet.eth_addresses.sample,
        amount: amount,
        cost: cost
      )
      puts "Payment with sender #{requester.first_name} #{requester.last_name} created"
    end
  end
end
