# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::ParseTransaction do
  let(:transaction) do
    {
      from: '0x1234from',
      to: '0x1234to',
      hash: '0xSomeBigHash',
      blockNumber: '0xBlockNumber',
      value: Eth::ValueFormatter.new(0.005).to_hex
    }.with_indifferent_access
  end
  let(:desired_params) do
    {
      from_eth: '0x1234from',
      to_eth: '0x1234to',
      tx_hash: '0xSomeBigHash',
      block_number: '0xBlockNumber',
      eth_amount: 0.005
    }.with_indifferent_access
  end
  let(:parse_transaction) { Eth::ParseTransaction.new(transaction) }

  describe '.initialize' do
    it { expect { parse_transaction }.not_to raise_error }
  end

  describe '.perform' do
    it { expect(parse_transaction.perform).to eq desired_params }
  end
end
