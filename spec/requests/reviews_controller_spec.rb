# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsController, type: :request do
  let(:user) { create(:user) }
  let(:req) { create(:request, :completed, requester: user.profile) }
  let(:review) { create(:review) }
  let!(:logged_user) { sign_in(user) }

  describe 'GET new' do
    before { get new_review_path(params: { review: review.attributes }), xhr: true }
    it { expect(response).to have_http_status(:no_content) }
  end

  describe 'POST create' do
    let(:review_params) { build(:review, request: req, author: user.profile).attributes }
    before { post reviews_path(params: { review: review_params }) }
    it_behaves_like 'created model',
                    model: Review,
                    flash: { type: :notice, message: 'Your review has been submited' },
                    authenticated_user: true
  end
end
