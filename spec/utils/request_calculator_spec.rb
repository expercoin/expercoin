# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RequestCalculator do
  let(:expert) { create(:profile, expercoin_rate: 0.0005) }
  let(:request) { create(:request, expert: expert, requested_length: '15min') }
  let(:request_calculator) { RequestCalculator.new(request) }

  describe '.initialize' do
    it { expect(request_calculator).to be_present }
  end

  describe '.calculate_cost' do
    it { expect(request_calculator.calculate_cost(0.0005)).to eq 0.0075 }
  end
end
