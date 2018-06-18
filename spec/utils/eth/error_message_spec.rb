# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::ErrorMessage do
  let(:to) { ENV['ETH_ADDRESS'] }
  let(:from) { "0x#{Faker::Crypto.sha1}" }
  let(:tx_hash) { "0x#{Faker::Crypto.sha256}" }
  let(:block_number) { "0x#{Faker::Number.hexadecimal(3)}" }
  let(:value) { Eth::ValueFormatter.new(0.005) }
  let(:transaction) do
    {
      from: from,
      to: to,
      hash: tx_hash,
      blockNumber: block_number,
      value: value
    }.with_indifferent_access
  end
  let(:error_message) { Eth::ErrorMessage.new(transaction).perform }

  describe '.initialize' do
    it { expect { described_class.new(transaction) }.not_to raise_error }
  end

  describe '.transaction_wrong_eth_address' do
    let(:to) { "0x#{Faker::Crypto.sha1}" }
    it { expect(error_message).to eq 'Wrong ETH Address' }
  end

  describe '.transaction_pending' do
    let(:block_number) { nil }
    it { expect(error_message).to eq 'ETH Transaction is in Pending Status' }
  end

  describe '.transaction_not_found' do
    let(:tx_hash) { nil }
    it { expect(error_message).to eq 'ETH Transaction Not Found' }
  end

  describe '.transaction_used' do
    let(:tx_hash) { create(:transaction).tx_hash }
    it { expect(error_message).to eq 'ETH Transaction Already Used' }
  end
end
