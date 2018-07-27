# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RequestsController, type: :request do
  let(:req) { create(:request, status: 'draft', title: 'Test') }
  let(:user) { req.requester.user }
  let!(:logged_user) { sign_in(user) }
  let(:expert) { req.expert }
  let(:request_params) do
    build(
      :request,
      requester: user.profile,
      expert: expert
    ).attributes
  end
  let(:update_params) do
    {
      title: 'Some Request Title',
      requested_length: '45min'
    }
  end

  describe 'GET index' do
    before { get requests_path }
    it_behaves_like 'loaded page', authenticated_user: true
  end

  describe 'GET new' do
    before { get new_request_path, params: { expert: expert.id } }
    it_behaves_like 'loaded page', authenticated_user: true
  end

  describe 'GET show' do
    before { get request_path(req) }
    it_behaves_like 'loaded page', authenticated_user: true
  end

  describe 'GET edit' do
    before { get edit_request_path(req) }
    it_behaves_like 'loaded page', authenticated_user: true
  end

  describe 'POST create' do
    before { post requests_path, params: { request: request_params } }
    it_behaves_like 'created model',
                    model: Request,
                    authenticated_user: true
  end

  describe 'PATCH update' do
    before { patch request_path(req), params: { request: update_params } }
    it_behaves_like 'updated model',
                    model: Request,
                    params: { 
                      status: 'pending',
                      title: 'Some Request Title',
                      requested_length: '45min'
                    },
                    authenticated_user: true
  end

  describe '.render_error_messages' do
    before do
      request_params[:title] = ''
      post requests_path, params: { request: request_params }
    end
    it { expect(flash[:alert]).not_to be_empty }
  end
end
