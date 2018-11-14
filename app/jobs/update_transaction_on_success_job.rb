class UpdateTransactionOnSuccessJob < ApplicationJob
  queue_as :default

  def perform(transaction, action)
    return if transaction.completed? || transaction.tx_hash.blank?
    return UpdateTransactionOnSuccessJob.set(wait: 2.minutes).perform_later(transaction, action) unless Eth::FindTransaction.new(transaction.tx_hash).perform
    return send(action, transaction) if Eth::StatusTransaction.new(transaction.tx_hash).fail?
    return update_status(transaction) if Eth::StatusTransaction.new(transaction.tx_hash).success?
  end

  private

  def destroy(transaction)
    transaction.destroy
  end

  def update(transaction)
    transaction.update(tx_hash: nil)
  end

  def update_status(transaction)
    transaction.update(status: 'completed')
  end
end
