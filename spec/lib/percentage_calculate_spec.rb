# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PercentageCalculate do
  let(:percentage_calculate) { described_class.new(7, 93) }

  describe '.initialize' do
    it { expect { percentage_calculate }.not_to raise_error }
  end

  describe '.decrease' do
    it { expect(percentage_calculate.decrease).to eq 86.49000000000001 }
  end

  describe '.increase' do
    it { expect(percentage_calculate.increase).to eq 100.0 }
  end
end
