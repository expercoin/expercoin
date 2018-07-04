# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceDecorator do
  let(:profile) { create(:profile, :with_photo, expercoin_rate: 500) }
  let(:profile2) { create(:profile, expercoin_rate: 800) }
  let(:service) { create(:service, profiles: [profile, profile2]) } # first profile is featured
  let(:service_decorate) { described_class.new(service) }
  let(:starting_eth_amount) { Eth::UsdConverter.new(5).eth_value }
  let!(:review) { create(:review, profile: profile, rate: 5) }

  describe '.starting_price_in_usd' do
    it { expect(service_decorate.starting_price_in_usd).to eq '$5.00 per minute' }
  end

  describe '.starting_price' do
    it { expect(service_decorate.starting_price).to eq "#{ENV['CURRENCY']} #{starting_eth_amount}" }
  end

  describe '.starting_price_full' do
    it { expect(service_decorate.starting_price_full).to eq "#{ENV['CURRENCY']} #{starting_eth_amount}" }
  end

  describe '.profile_photo' do
    it { expect(service_decorate.profile_photo).to eq profile.photo.thumb.url }
  end

  describe '.profile_full_name' do
    it { expect(service_decorate.profile_full_name).to eq "#{profile.first_name} #{profile.last_name}" }
  end

  describe '.profile_full_name' do
    it { expect(service_decorate.rating).to eq 5 }
  end
end
