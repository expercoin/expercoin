# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::UsdConverter do
  let(:eth_value) { 0.000015 }
  let(:usd_converter) { Eth::UsdConverter.new(eth_value) }
  let(:usd_rate) do
    req = JSON.parse(URI.parse('https://api.coinmarketcap.com/v1/ticker/ethereum/').read)
    req[0]['price_usd'].to_f if req.present?
  end

  describe '.initialize' do
    it { expect { usd_converter }.not_to raise_error }
  end

  describe '.usd_value' do
    it { expect(usd_converter.usd_value).to eq usd_rate * eth_value }
  end

  describe '.eth_value' do
    let(:usd_converter) { Eth::UsdConverter.new(0.01) }
    it { expect(usd_converter.eth_value).to eq 0.01 / usd_rate  }
  end
end
