# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MSP::UpdateRequestStatus do
  let(:request) { create(:request, status: 'draft') }

  describe '.initialize' do
    it { expect { described_class.new(request) }.not_to raise_error }
  end

  describe 'from draft to pending' do
    before { update_request_status }
    it { expect(request.status).to eq 'pending' }
  end

  describe 'from draft to pending' do
    let(:request) { create(:request, :accepted, status: 'pending') }
    before { update_request_status }
    it { expect(request.status).to eq 'accepted' }
  end

  describe 'from pending to verifying' do
    let(:request) { create(:request, :verifying, status: 'accepted') }
    before { update_request_status }
    it { expect(request.status).to eq 'verifying' }
  end

  describe 'from verifying to verified' do
    let(:request) { create(:request, :verified, status: 'verifying') }
    before { update_request_status }
    it { expect(request.status).to eq 'verified' }
  end

  describe 'from verified to inprogress' do
    let(:request) { create(:request, :inprogress, status: 'verified') }
    before { update_request_status }
    it { expect(request.status).to eq 'inprogress' }
  end

  describe 'from inprogress to completed' do
    let(:request) { create(:request, :completed, status: 'inprogress') }
    before { update_request_status }
    it { expect(request.status).to eq 'completed' }
  end

  private

  def update_request_status
    MSP::UpdateRequestStatus.new(request).perform
  end
end
