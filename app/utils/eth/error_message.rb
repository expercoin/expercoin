module Eth
  class ErrorMessage
    def initialize(eth_transaction)
      @eth_transaction = eth_transaction || {}
    end

    def perform
      message = transaction_not_found
      message ||= transaction_used
      message ||= transaction_pending
      message
    end

    private

    def transaction_pending
      return if @eth_transaction['blockNumber']
      'ETH Transaction is in Pending Status'
    end

    def transaction_not_found
      return if @eth_transaction['hash']
      'ETH Transaction Not Found'
    end

    def transaction_used
      return unless Transaction.find_by_tx_hash(@eth_transaction['hash'])
      'ETH Transaction Already Used'
    end
  end
end
