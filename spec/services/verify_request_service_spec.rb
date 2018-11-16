# frozen_string_literal: true

require 'rails_helper'

RSpec.describe VerifyRequestService do
  let(:expert) { create(:profile) }
  let(:request) { create(:request, expert: expert, status: 'accepted', requested_length: '30min', requested_amount_eth: 0.00340719821772126) }
  let(:params) do
    {
      tx_hash: '0x4e581a5bd3acdd90de0cbf052c966ae9101cadbd19eb59eababb37e6f629ea61',
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
