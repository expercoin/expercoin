# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceDecorator do
  let(:profile) { create(:profile, expercoin_rate: 0.0005) }
  let(:profile2) { create(:profile, expercoin_rate: 0.001) }
  let(:service) { create(:service, profiles: [profile, profile2]) }
  let(:service_decorate) { described_class.new(service) }
  let(:rate_in_usd) { Eth::UsdConverter.new(0.0005).usd_value.round(2).to_s }

  describe '.starting_price_in_usd' do
    it { expect(service_decorate.starting_price_in_usd).to match(/^\$?[0-9]+(\.[0-9][0-9])?$/) }
    it { expect(service_decorate.starting_price_in_usd).to include rate_in_usd }
  end
end
