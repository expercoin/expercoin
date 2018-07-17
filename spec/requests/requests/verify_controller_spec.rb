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
      tx_hash: '0xcce351e43a4c3ed8b9e4e96652992d1a9c1f928497eb0ba470997ccc6a56f917',
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
    it { expect(req.status).to eq 'verified' }
    it { expect(req.notifications.count).to eq 1 }
    it { expect(enqueued_jobs.size).to eq(2)  }
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
    it { expect(req.notifications.count).to eq 1 }
    it { expect(enqueued_jobs.size).to eq(0) }
    it { expect(response).to redirect_to request_path(req) }
  end
end
