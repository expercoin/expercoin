# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Requests::VerifyController, type: :request do
  include ActiveJob::TestHelper

  let(:req) { create(:request, :accepted) }
  let(:profile) { req.requester }
  let(:user) { profile.user }
  let!(:signed_user) { sign_in(user) }
  let(:verify_params) do
    {
      tx_hash: '0xe1b91f4418cefb8449b741285f8f59efc1b52ae08c5aac1dd63e293babef8539',
      sender: user,
      request: req
    }
  end

  describe 'GET index' do
    before { get request_verify_index_path(req) }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'POST create' do
    before do
      post request_verify_index_path(req), params: { verify: verify_params }
      req.reload
    end
    it_behaves_like 'authenticated user'
    it { expect(req.status).not_to eq 'accepted' }
    it { expect(UpdateVerifyingRequestJob).to have_been_enqueued }
    it { expect(response).to redirect_to request_path(req) }
  end

  describe 'POST create invalidate date' do
    before do
      req.update_attribute(:selected_date, Time.now - 10.minutes)
      post request_verify_index_path(req), params: { verify: verify_params }
      req.reload
    end
    it_behaves_like 'authenticated user'
    it { expect(req.status).to eq 'accepted' }
    it { expect(enqueued_jobs.size).to eq(0) }
    it { expect(response).to redirect_to request_path(req) }
  end
end
