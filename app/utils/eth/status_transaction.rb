module Eth
  class StatusTransaction
    def initialize(tx_hash)
      @tx_hash = tx_hash
    end

    def fail?
      http_client_tx_status['status'].hex.zero? && http_client_tx_status['blockNumber'].present?
    rescue StandardError
      false
    end

    def success?
      result['status'].hex == 1 && result['blockNumber'].present?
    rescue StandardError
      false
    end

    private

    def result
      http_client_tx_status
    end

    def http_client_tx_status
      Ethereum::HttpClient.new(ENV['ETH_NODE_HTTP_PATH'])
                          .yield_self { |it| it.eth_get_transaction_receipt(@tx_hash) }
                          .yield_self { |it| it['result'] }
    rescue StandardError
      {}
    end
  end
end
