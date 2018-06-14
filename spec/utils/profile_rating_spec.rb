# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileRating do
  let(:review) { create(:review, rate: 5) }
  let(:profile) { review.profile }
  let(:author) { review.author }
  let(:profile_rating) { ProfileRating.new(profile) }

  describe '.initialize' do
    it { expect { profile_rating }.not_to raise_error }
  end

  describe '.student_rating' do
    it { expect(profile_rating.student_rating(author)).to eq 5 }
  end

  describe '.average_rating' do
    before do
      create(:review, request: review.request, rate: 2, profile: profile)
    end
    it { expect(profile_rating.average_rating).to eq 3.5 }
  end
end
