module Eth
  class FindTransaction
    def initialize(tx_hash)
      @tx_hash = tx_hash
    end

    def perform
      return false unless result.present?
      result
    end

    private

    def result
      http_client_tx_hash
    end

    def http_client_tx_hash
      Ethereum::HttpClient.new(ENV['ETH_NODE_HTTP_PATH'])
                          .yield_self { |it| it.eth_get_transaction_by_hash(@tx_hash) }
                          .yield_self { |it| it['result'] }
    rescue StandardError
      {}
    end

    def ipc
      Ethereum::IpcClient.new(ENV['ETH_NODE_IPC_PATH'], false)
                         .yield_self { |it| it.eth_get_transaction_by_hash(@tx_hash) }
                         .yield_self { |it| it['result'] }
    rescue StandardError
      {}
    end
  end
end
