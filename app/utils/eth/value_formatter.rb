# frozen_string_literal: true

module Eth
  class ValueFormatter
    def initialize(value)
      @value = value
      @eth_formatter = Ethereum::Formatter.new
    end

    def from_hex
      @eth_formatter.from_wei(@value.to_s.hex).to_f
    end

    def to_hex
      "0x#{to_wei.to_s(16)}"
    end

    private

    def to_wei
      @eth_formatter.to_wei(@value)
    end
  end
end
