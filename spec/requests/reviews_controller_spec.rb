# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReviewsController, type: :request do
  let(:user) { create(:user) }
  let(:review) { create(:review) }
  let!(:logged_user) { sign_in(user) }

  describe 'GET new' do
    before { get new_review_path(params: {review: review.attributes}), xhr: true }
    it { expect(response).to have_http_status(:no_content) }
  end

  describe 'POST create' do
    before { post reviews_path(params: { review: review.attributes }) }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:redirect) }
    it { expect(flash[:notice]).to eq("Your review has been submited") }
    it { expect(response).to redirect_to(request_path(review.request)) }
  end
end
