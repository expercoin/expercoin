# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VerifyRequestService do
  let(:expert) { create(:profile) }
  let(:request) { create(:request, expert: expert, status: 'accepted', requested_length: '30min') }
  let(:params) do
    {
      tx_hash: '0xe1b91f4418cefb8449b741285f8f59efc1b52ae08c5aac1dd63e293babef8539',
      sender: request.requester.user,
      request: request
    }
  end
  let(:verify_request_service) { VerifyRequestService.new(params) }

  describe '.initialize' do
    it { expect { verify_request_service }.not_to raise_error }
  end

  describe '.request_verified?' do
    context 'before perform' do
      it { expect(verify_request_service.request_verified?).to be false }
    end
    context 'after perform' do
      before { verify_request_service.perform }
      it { expect(verify_request_service.request_verified?).to be true }
    end
  end

  describe '.perform' do
    before do
      verify_request_service.perform
      request.reload
    end
    it 'should have create transaction' do
      expect(request.eth_transactions).not_to be_empty
    end
  end

  describe '.error_message' do
    it { expect(verify_request_service.error_message).to be_nil }
  end

  describe '.pending' do
    it { expect(verify_request_service.pending?).to eq false }
  end
end
