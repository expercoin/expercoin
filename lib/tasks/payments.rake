namespace :payments do
  desc 'Create test payments'
  task create_test_payments: :environment do
    requests = Request.completed
    requests.each do |request|
      length = request.ended_at - request.started_at
      rate = request.expert.expercoin_rate
      amount = rate * length
      transaction = Transaction.create!(
        sender: request.requester.user,
        request: request,
        tx_hash: "0x#{Faker::Bitcoin.testnet_address}",
        block_number: "0x#{Faker::Number.hexadecimal(3)}",
        from_eth: request.requester.wallet.eth_addresses.sample.public_key,
        to_eth: '0xbfdbbA3223F3ec256eddE4916BdF343725481CFA',
        eth_amount: amount,
      )
      puts "Payment with sender #{request.requester.first_name} #{request.requester.last_name} created"
    end
  end
end
