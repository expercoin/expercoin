# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceRating do
  let(:review) { create(:review, rate: 5) }
  let(:profile) { review.profile }
  let!(:review2) { create(:review, rate: 2, profile: profile) }
  let(:service) { create(:service, profiles: [profile]) }
  let(:service_rating) { described_class.new(service) }

  describe '.initialize' do
    it { expect { service_rating }.not_to raise_exception }
  end

  describe '.average_rating' do
    it { expect(service_rating.average_rating).to eq 3.5 }
  end
end
