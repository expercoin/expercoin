# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::ValueFormatter do
  let(:value) { 0.005 }
  let(:value_formatter) { Eth::ValueFormatter.new(value) }
  let(:value_in_wei) { value * "1#{'0' * 18}".to_i }
  let(:value_in_hex) { "0x#{format('%02x', value_in_wei)}" }

  describe '.initialize' do
    it { expect { value_formatter }.not_to raise_error }
  end

  describe '.from_hex' do
    it { expect(Eth::ValueFormatter.new(value_in_hex).from_hex).to eq value }
  end

  describe '.to_hex' do
    it { expect(value_formatter.to_hex).to eq value_in_hex }
  end
end
