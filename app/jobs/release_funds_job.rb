class ReleaseFundsJob < ApplicationJob
  queue_as :default

  def perform(transaction)
    raise StandardError if transaction.tx_hash
    Eth::CreateTransaction.new(transaction.eth_amount, transaction.to_eth)
                          .perform
                          .yield_self { |tx_hash| transaction.update(tx_hash: tx_hash) }
  rescue StandardError
    'Fail'
  end
end
