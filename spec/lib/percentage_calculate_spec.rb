# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PercentageCalculate do
  let(:percentage_calculate) { described_class.new(7, 0.0005) }

  describe '.initialize' do
    it { expect { percentage_calculate }.not_to raise_error }
  end

  describe '.decrease' do
    it { expect(percentage_calculate.decrease).to eq 0.000465 }
  end

  describe '.increase' do
    let(:percentage_calculate) { described_class.new(7, 0.000465) }
    it { expect(percentage_calculate.increase).to eq 0.0005 }
  end
end
