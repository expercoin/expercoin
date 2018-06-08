class ReleaseFundsJob < ApplicationJob
  queue_as :default

  def perform(transaction)
    Eth::CreateTransaction.new(transaction.eth_amount, transaction.to_eth)
                          .perform
                          .yield_self { |it| transaction.update(tx_hash: it['hash']) }
  rescue StandardError
    'Fail'
  end
end
