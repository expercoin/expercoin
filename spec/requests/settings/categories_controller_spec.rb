# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Settings::CategoriesController, type: :request do
  let(:user) { create(:user) }
  let!(:logged_user) { sign_in(user) }

  describe 'GET index' do
    before { get settings_categories_path }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST create' do
    before { post settings_categories_path, params: { profile_form: { category_ids: ['1'] } }, xhr: true }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end
end
