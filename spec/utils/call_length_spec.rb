# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CallLength do
  let(:calls) do
    5.times do
      create(:request, :completed, requested_length: '15min')
    end
    Request.completed
  end
  let(:call_length) { CallLength.new(calls) }

  describe '.initialize' do
    it { expect { call_length }.not_to raise_error }
  end

  describe '.average_length' do
    it { expect(call_length.average_length).to eq 15 }
  end

  describe '.total_price' do
  end

  describe '.total_length' do
    it { expect(call_length.total_length).to eq 75 }
  end
end
