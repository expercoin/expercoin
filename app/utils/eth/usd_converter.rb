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
    rescue StandardError
      nil
    end

    private

    def price_usd
      Rails.cache.fetch("eth_price_usd", expires_in: 2.hours) do
        req = JSON.parse(open('https://api.coinmarketcap.com/v1/ticker/ethereum/').read)
        req[0]['price_usd'].to_f
      end
    rescue StandardError
      false
    end
  end
end
