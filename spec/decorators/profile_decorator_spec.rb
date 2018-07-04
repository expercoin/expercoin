# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileDecorator do
  let(:eth_rate) { Eth::UsdConverter.new(1.5).eth_value }
  let(:profile) { create(:profile, expercoin_rate: 150) }
  let(:avg_rating) { ProfileRating.new(profile).average_rating }
  let(:completed_request) { create(:request, :completed, expert: profile) }
  let(:profile_decorator) { ProfileDecorator.new(profile) }
  let!(:message) { create(:message, :unread, receiver: profile.user) }

  describe '.full_name' do
    it 'should eq full name' do
      full_name = "#{profile.first_name} #{profile.last_name}"
      expect(profile_decorator.full_name).to eq full_name
    end
  end

  describe '.display_location_with_abbreviation' do
    it 'shoud include country in output' do
      expect(profile_decorator.display_location_with_abbreviation).to include(profile.country)
    end
    it 'should include state in output' do
      expect(profile_decorator.display_location_with_abbreviation).to include(profile.state)
    end
  end

  describe '.last_session' do
    it 'should return correct format' do
      datetime_format = completed_request.created_at.strftime('%b, %-d %Y')
      expect(profile_decorator.last_session).to eq datetime_format
    end
  end

  describe '.average_rating' do
    it { expect(profile_decorator.average_rating).to eq avg_rating }
  end

  describe '.display_rate' do
    it { expect(profile_decorator.display_rate).to eq eth_rate }
  end

  describe '.display_rate' do
    it { expect(profile_decorator.display_rate_in_usd).to eq 1.5 }
  end

  describe '.unread_messages' do
    it { expect(profile_decorator.unread_messages).to eq 1 }
  end

  describe '.unread_messages?' do
    it { expect(profile_decorator.unread_messages?).to be true }
  end

  describe '.status_calls_count' do
    # needs to be implemented with group examples
  end

  describe '.status_requests_count' do
    # needs to be implemented with group examples
  end
end
