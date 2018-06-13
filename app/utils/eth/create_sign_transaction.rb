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
      # (@amount.to_f * 1_000_000_000_000_000_000.0).to_i
      @amount.hex
    end

    def sign_params
      {
        key: ENV['PRIVATE_KEY'],
        address: @address,
        amount: wei_amount,
        from: ENV['ETH_ADDRESS']
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
