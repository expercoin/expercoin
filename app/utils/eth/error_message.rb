module Eth
  class ErrorMessage
    def initialize(eth_transaction)
      @eth_transaction = eth_transaction || {}
    end

    def perform
      message = transaction_not_found
      message ||= transaction_used
      message ||= transaction_wrong_eth_address
      message ||= transaction_pending
      message
    end

    private

    def transaction_wrong_eth_address
      return if @eth_transaction['to'] == ENV['ETH_ADDRESS']
      'Wrong ETH Address'
    end

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
