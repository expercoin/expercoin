# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MSP::Email::Request do
  let(:expert) { create(:profile) }
  let(:requester) { create(:profile) }
  let(:request) { create(:request, expert: expert, requester: requester) }
  let(:msp_email_request) { MSP::Email::Request.new(request) }

  describe '.initialize' do
    it { expect { msp_email_request }.not_to raise_error }
  end

  describe '.notify' do
    before { msp_email_request.notify }
    it { expect(MailRecord.count).to eq 1 }
  end

  describe 'mail for accepted request' do
    context 'requester' do
      let(:request) do
        create(:request, :accepted,
               expert: expert,
               requester: requester,
               updated_by: requester)
      end
      before { msp_email_request.notify }
      it { expect(MailRecord.first.recipient_id).to eq expert.id }
    end

    context 'requester' do
      let(:request) do
        create(:request, :accepted,
               expert: expert,
               requester: requester,
               updated_by: expert)
      end
      before { msp_email_request.notify }
      it { expect(MailRecord.first.recipient_id).to eq requester.id }
    end
  end
end
