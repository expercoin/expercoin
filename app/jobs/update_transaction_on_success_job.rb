class UpdateTransactionOnSuccessJob < ApplicationJob
  queue_as :default

  def perform(transaction, action)
    return if transaction.completed? || transaction.tx_hash.blank?
    return send(action, transaction) if Eth::StatusTransaction.new(transaction.tx_hash).fail?
    return update_status(transaction) if Eth::StatusTransaction.new(transaction.tx_hash).success?
    UpdateTransactionOnSuccessJob.set(wait: 1.minutes).perform_later(transaction, action)
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
