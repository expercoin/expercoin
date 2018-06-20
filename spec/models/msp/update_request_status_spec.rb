# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MSP::UpdateRequestStatus do
  STATUS_TRANSITIONS = [
    OpenStruct.new(from: 'draft', to: 'pending'),
    OpenStruct.new(from: 'pending', to: 'accepted'),
    OpenStruct.new(from: 'accepted', to: 'verifying'),
    OpenStruct.new(from: 'verifying', to: 'verified'),
    OpenStruct.new(from: 'verified', to: 'inprogress'),
    OpenStruct.new(from: 'inprogress', to: 'completed')
].freeze

  let(:request) { create(:request, status: 'draft') }

  describe '.initialize' do
    it { expect { described_class.new(request) }.not_to raise_error }
  end

  STATUS_TRANSITIONS.each do |obj|
    describe "from #{obj.from} to #{obj.to}" do
      let(:request) { create(:request, obj.to.to_sym, status: obj.from) }
      before { update_request_status }
      it { expect(request.status).to eq obj.to }
    end
  end

  private

  def update_request_status
    MSP::UpdateRequestStatus.new(request).perform
  end
end
