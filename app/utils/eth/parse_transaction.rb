module Eth
  class ParseTransaction
    def initialize(transaction)
      @transaction = transaction
      @params = {}
    end

    def perform
      @params['tx_hash'] = tx_hash
      @params
    end

    def value
      Ethereum::Formatter.new
                        .yield_self { |it| it.output_to_int(@transaction['value']) }
    end

    def from
      @transaction['from']
    end

    def to
      @transaction['to']
    end

    def tx_hash
      @transaction['hash']
    end

    def block_number
      @transaction['blockNumber']
    end
  end
end