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
      @transaction['value']
    end

    def attributes_list
      %w[tx_hash from_eth to_eth block_number eth_amount]
    end
  end
end
