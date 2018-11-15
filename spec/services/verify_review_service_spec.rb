# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VerifyReviewService do
  let(:user) { create(:user) }
  let(:req) { create(:request, :completed, requester: user.profile) }
  let(:message) { 'rgherherherh' }
  let(:rate) { 3}
  let(:tx_hash) { '0xf104a50a3f09444cf0a964e47378d3a8c6280179d76fd3825dca493ed1172374' }
  let(:review) do
    build(:review,
           request: req,
           author: user.profile,
           message: message,
           rate: rate,
           tx_hash: '0xf104a50a3f09444cf0a964e47378d3a8c6280179d76fd3825dca493ed1172374',
           status: :completed
          )
  end

  subject { described_class.new(review: review) }

  describe '#initialize' do
    it { expect(subject).to be_present }
  end

  describe '#review_verified?' do
    it { expect(subject.review_verified?).to eq true }
  end

  describe '#perform when valid' do
    before { subject.perform }
    it_behaves_like 'created model', model: Review
  end

  describe '#perfom when not valid' do
    context 'when wrong message' do
      let(:message) { 'wrong message' }
      it { expect(subject.perform).to eq false }
    end

    context 'when wrong rate' do
      let(:rate) { 1 }
      it { expect(subject.perform).to eq false }
    end
  end
end
