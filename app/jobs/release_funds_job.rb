class ReleaseFundsJob < ApplicationJob
  queue_as :default

  def perform(transaction)
    raise StandardError if transaction.tx_hash
    tx_hash = Eth::CreateSignTransaction.new(transaction.eth_amount, transaction.to_eth).perform
    transaction.update(tx_hash: tx_hash)
    UpdateExpertsTransactionsJob.set(wait: 2.minutes).perform_later
  rescue StandardError
    'Fail'
  end
end
