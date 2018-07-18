# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DatetimeValidator do
  let(:correct) { described_class.new(Time.now, {start_date: Time.now, end_date: Time.now + 10.minutes }) }

  describe '.initialize' do
    it { expect { correct }.not_to raise_error }
  end
end
