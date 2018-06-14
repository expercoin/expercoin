# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MSP::UpdateRequestStatus do
  let(:request) { create(:request, status: 'draft') }
  let(:update_request_status) { MSP::UpdateRequestStatus.new(request) }

  describe '.initialize' do
    it { expect { update_request_status }.not_to raise_error }
  end

  describe '.perform' do
    before do
      update_request_status.perform
    end

    context 'when draft' do
      it { expect(request.status).to eq 'pending' }
    end
  end
end
