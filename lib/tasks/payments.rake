namespace :payments do
  desc 'Create test payments'
  task create_test_payments: :environment do
    requests = Request.verified
    requests.each do |request|
      length = request.requested_length.to_i
      rate = request.expert.expercoin_rate.to_f
      amount = rate * length
      transaction = Transaction.create!(
        sender: request.requester.user,
        request: request,
        tx_hash: "0x#{Faker::Crypto.sha256}",
        block_number: "0x#{Faker::Number.hexadecimal(3)}",
        from_eth: request.requester.wallet.eth_addresses.sample.public_key,
        to_eth: '0xbfdbbA3223F3ec256eddE4916BdF343725481CFA',
        eth_amount: amount,
      )
      puts "Payment with sender #{request.requester.first_name} #{request.requester.last_name} created"
    end
  end

  desc 'Create test payments with parent'
  task create_test_payments_with_parent: :environment do
    transactions = Transaction.all
    transactions.each do |parent|
      amount = parent.eth_amount.to_f
      # to expert
      transaction = Transaction.create(
        parent: parent,
        sender: parent.sender,
        receiver: parent.request.expert.user,
        request: parent.request,
        eth_amount: amount * 0.93,
        from_eth: parent.to_eth,
        to_eth: parent.request.expert.wallet.eth_addresses.sample.public_key,
        status: 'pending'
      )
      puts "Payment with receiver #{transaction.receiver.profile.first_name} #{transaction.receiver.profile.last_name} created"

      # to expercoin
      transaction = Transaction.create(
        parent: parent,
        sender: parent.sender,
        request: parent.request,
        eth_amount: amount * (ENV['EXPERCOIN_RATE'].to_i / 100.0),
        from_eth: parent.to_eth,
        status: 'completed'
      )
      puts "Payment with to expercoin created"
    end
  end
end
