# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DatetimeValidator do
  let(:time) { Time.now }
  let(:range) { { start_date: time, end_date: time + 10.minutes } }
  let(:correct) { described_class.new(time, range) }
  let(:false) { described_class.new(time - 10.minutes, range) }

  describe '.initialize' do
    it { expect { correct }.not_to raise_error }
  end

  describe '.in_range' do
    it { expect(correct.in_range).to eq true }
  end
end
