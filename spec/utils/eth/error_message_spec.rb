# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::ErrorMessage do
  let(:transaction) do
    {
      from: '0x1234from',
      to: '0x1234to',
      hash: '0xSomeBigHash',
      blockNumber: '0xBlockNumber',
      value: Eth::ValueFormatter.new(0.005).to_hex
    }.with_indifferent_access
  end
  let(:error_message) { Eth::ErrorMessage.new(transaction) }

  describe '.initialize' do
    it { expect { error_message }.not_to raise_error }
  end

  describe '.perform' do
  end
end
