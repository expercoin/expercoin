# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileDecorator do
  let(:rate) { 0.0005 }
  let(:profile) { create(:profile, expercoin_rate: rate) }
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

  describe '.exc_price' do
    it 'should include rate in output' do
      expect(profile_decorator.exc_price).to include(rate.to_s)
    end
  end

  describe '.display_rate' do
    it { expect(profile_decorator.display_rate).to eq rate }
  end

  describe '.unread_messages' do
    it { expect(profile_decorator.unread_messages).to eq 1 }
  end

  describe '.unread_messages?' do
    it { expect(profile_decorator.unread_messages?).to be true }
  end

  describe '.display_rate_in_usd' do
    it { expect(profile_decorator.display_rate_in_usd.to_f).to be 0.27 }
  end
  
  describe '.status_calls_count' do
    # needs to be implemented with group examples
  end

  describe '.status_requests_count' do
    # needs to be implemented with group examples
  end
end
