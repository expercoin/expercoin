# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceDecorator do
  let(:profile) { create(:profile, :with_photo) }
  let(:user) { profile.user }
  let(:service) { create(:service, owner: user, expercoin_rate: 500, rate: 465) }
  let(:service_decorate) { described_class.new(service) }
  let(:eth_amount) { Eth::UsdConverter.new(5).eth_value }

  describe '.profile_photo' do
    it { expect(service_decorate.profile_photo).to eq profile.photo.thumb.url }
  end

  describe '.profile_full_name' do
    it { expect(service_decorate.profile_full_name).to eq "#{profile.first_name} #{profile.last_name}" }
  end

  describe '.display_rate' do
    it { expect(service_decorate.display_rate).to eq eth_amount }
  end

  describe '.owner_profile' do
    it { expect(service_decorate.owner_profile).to eq profile }
  end
end
