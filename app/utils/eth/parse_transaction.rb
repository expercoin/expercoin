# frozen_string_literal: true

module Eth
  class ParseTransaction
    def initialize(transaction)
      @transaction = transaction
      @params = {}
    end

    def perform
      attributes_list.each do |attribute|
        @params[attribute] = send(attribute)
      end
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

    def attributes_list
      %w[tx_hash from_eth to_eth block_number eth_amount]
    end
  end
end
