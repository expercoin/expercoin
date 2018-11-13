# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsController, type: :request do
  let(:user) { create(:user) }
  let(:req) { create(:request, :completed, requester: user.profile) }
  let(:review) { create(:review) }
  let!(:logged_user) { sign_in(user) }
  let(:review_params) do
    build(:review, request: req, author: user.profile, message: 'rgherherherh', rate: 3).attributes.merge(
      tx_hash: '0xf104a50a3f09444cf0a964e47378d3a8c6280179d76fd3825dca493ed1172374'
    )
  end

  describe 'GET new' do
    before { get new_review_path(params: { review: review.attributes }), xhr: true }
    it { expect(response).to have_http_status(:no_content) }
  end

  describe 'POST create' do
    before { post reviews_path(params: { review: review_params }) }
    it_behaves_like 'created model',
                    model: Review,
                    flash: { type: :notice, message: 'Your review has been submited' },
                    authenticated_user: true
  end
end
