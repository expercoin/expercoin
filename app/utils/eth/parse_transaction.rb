module Eth
  class ParseTransaction
    def initialize(transaction)
      @transaction = transaction
      @params = {}
    end

    def perform
      @params['tx_hash'] = tx_hash
      @params['from_eth'] = from_eth
      @params['to_eth'] = to_eth
      @params['block_number'] = block_number
      @params['eth_amount'] = eth_amount
      @params
    end

    private

    def value
      Ethereum::Formatter.new
                        .yield_self { |it| it.output_to_int(@transaction['value']) }
    end

    def from_eth
      @transaction['from']
    end

    def to_eth
      @transaction['to']
    end

    def tx_hash
      @transaction['hash']
    end

    def block_number
      @transaction['blockNumber']
    end

    def eth_amount
      value / "1#{'0' * 18}".to_f.round(5)
    end

    def rate
      # to be implemented
    end

    def usd_amount
      # to be implemented
    end
  end
end
