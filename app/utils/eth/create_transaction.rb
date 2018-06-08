module Eth
  class CreateTransaction
    ACCOUNT_ADDRESS = ENV['ETH_ADDRESS']

    def initialize(amount, address)
      @amount = amount
      @address = address
      @client = Ethereum::IpcClient.new(ENV['ETH_NODE_IPC_PATH'], false)
    end

    def perform
      # client.gas_limit = 2_000_000
      # client.gas_price = 24_000_000_000
      send_transaction
    end

    private

    def send_transaction
      @client.eth_send_transaction(params)
             .yield_self { |it| it['result'] }
    rescue StandardError
      nil
    end

    def params
      {
        "from": ACCOUNT_ADDRESS,
        "to": @address,
        "value": wei_amount_in_hex
      }
    end

    def wei_amount_in_hex
      '0x' + format('%02x', wei_amount)
    end

    def wei_amount
      (@amount.to_f * 1_000_000_000_000_000_000.0).to_i
    end
  end
end
