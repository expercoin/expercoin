module Eth
  class CreateSignTransaction
    def initialize(amount, address)
      @amount = amount
      @address = address
    end

    def perform
      send_sign_transaction
    end

    private

    def send_sign_transaction
      request['hash']
    rescue StandardError
      nil
    end

    def wei_amount
      return @amount.hex if hex_value
      (@amount.to_f * 1_000_000_000_000_000_000.0).to_i
    end

    def hex_value
      @amount.to_s&.downcase&.starts_with?('0x')
    end

    def sign_params
      {
        key: ENV['PRIVATE_KEY'],
        address: @address,
        amount: wei_amount,
        from: ENV['ETH_ADDRESS'],
        api_key: ENV['INFURA']
      }
    end

    def request
      require "uri"
      require "net/http"

      Net::HTTP.post_form(
        URI.parse(ENV['LOCAL_EXPRESS_SERVER']),
        sign_params
      ).yield_self(&:body)
       .yield_self{ |body| JSON.parse(body) }
    end
  end
end
