# frozen_string_literal: true

module Eth
  class UsdConverter
    def initialize(value)
      @value = value
    end

    def usd_value
      @value * price_usd
    rescue StandardError
      nil
    end

    def eth_value
      @value / price_usd
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
