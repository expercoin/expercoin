class UpdateTransactionStatusJob < ApplicationJob
  queue_as :default

  def perform(transaction)
    return if transaction.completed?
    Eth::FindTransaction
        .new(transaction.tx_hash)
        .perform
        .yield_self { |tx| transaction.update(status: 'completed') if tx['blockNumber'] }
  end
end
