# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::ValueFormatter do
  OPTIONS = [
    { key: 'from_hex', val: '0x11c37937e08000', result: 0.005 },
    { key: 'to_hex', val: 0.005, result: '0x11c37937e08000' }
  ].freeze

  describe '.initialize' do
    it { expect { value_formatter }.not_to raise_error }
  end

  OPTIONS.each do |obj|
    describe obj[:key] do
      it { expect(described_class.new(obj[:val]).from_hex).to eq obj[:result] }
    end
  end
end
