# frozen_string_literal: true

module Eth
  class UsdConverter
    def initialize(eth_value)
      @eth_value = eth_value
    end

    def usd_value
      @eth_value * price_usd
    rescue StandardError
      nil
    end

    private

    def price_usd
      req = JSON.parse(open('https://api.coinmarketcap.com/v1/ticker/ethereum/').read)
      req[0]['price_usd'].to_f
    rescue StandardError
      false
    end
  end
end
