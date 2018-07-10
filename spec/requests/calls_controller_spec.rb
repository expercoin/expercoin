# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CallsController, type: :request do
  let!(:request_made) { create(:request) }
  let!(:user) { request_made.expert.user }
  let!(:logged_user) { sign_in(user) }
  let(:request_params) { build(:request) }

  describe 'GET index' do
    before { get calls_path }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'GET show' do
    before { get call_path(request_made) }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'POST update' do
    before { patch call_path(id: request_made.id, request: attributes_for(:request)) }
    it_behaves_like 'authenticated user'
    it { expect(response).to redirect_to calls_path }
  end

  describe 'GET reject' do
    before do
      get reject_call_path(request_made)
      request_made.reload
    end
    it_behaves_like 'authenticated user'
    it { expect(request_made.status).to eq 'rejected' }
  end
end
