class UpdateExpertsTransactionsJob < ApplicationJob
  queue_as :default

  def perform
    Transaction.expert.each do |transaction|
      find_transaction(transaction)
        .yield_self { |t| transaction.update(status: 'completed') if t['blockNumber'] }
    end
  rescue StandardError
    'Fail'
  end

  private

  def find_transaction(transaction)
    Eth::FindTransaction.new(transaction.tx_hash).perform
  end
end
