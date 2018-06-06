module Eth
  class FindTransaction
    API_KEY = 'PH26WWT52U6F4M9EQ1CUU6KCHF85AHCU8A'
    EXPERCOIN_ETH = '0xbfdbbA3223F3ec256eddE4916BdF343725481CFA'

    def initialize(tx_hash)
      @tx_hash = tx_hash
    end

    def perform
      return false unless result.present?
      result
    end

    private

    def result
      ipc
    end

    def ipc
      Ethereum::IpcClient.new("/home/sedad/Desktop/ethereum/ACPrivateChain/geth.ipc", false)
                         .yield_self { |it| it.eth_get_transaction_by_hash(@tx_hash) }
                         .yield_self { |it| it['result'] }
    rescue StandardError
      {}
    end
  end
end
