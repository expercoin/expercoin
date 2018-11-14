# frozen_string_literal: true

module Eth
  # Eth Contract
  class Contract
    extend ContractData

    def initialize(tx_hash)
      @tx_hash = tx_hash
    end

    def created?
      contract_address
    rescue NoMethodError
      false
    end

    %w[amount call_id site_address].each do |function|
      define_method function do
        client.eth_call(to: contract_address, data: "0x#{send("#{function}_signature")}")
              .yield_self { |it| it['result'] }
      end
    end

    def contract_address
      client.eth_get_transaction_receipt(@tx_hash)
            .yield_self { |it| it['result']['contractAddress'] }
    end

    private

    def client
      Ethereum::HttpClient.new(ENV['ETH_NODE_HTTP_PATH'])
    end

    def amount_signature
      Ethereum::Function.new(Eth::Contract.abi[5].with_indifferent_access).signature
    end

    def call_id_signature
      Ethereum::Function.new(Eth::Contract.abi[3].with_indifferent_access).signature
    end

    def site_address_signature
      Ethereum::Function.new(Eth::Contract.abi[1].with_indifferent_access).signature
    end
  end
end
