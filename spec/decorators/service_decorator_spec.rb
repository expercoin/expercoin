# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceDecorator do
  let(:service) { create(:service) }
  let(:service_decorate) { described_class.new(service) }

  describe '.starting_price_in_usd' do
    it { expect(service_decorate.starting_price_in_usd).to match(/^\$?[0-9]+(\.[0-9][0-9])?$/) }
  end
end
