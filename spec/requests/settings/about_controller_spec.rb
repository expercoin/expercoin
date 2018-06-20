# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Settings::AboutController, type: :request do
  let(:user) { create(:user) }
  let!(:logged_user) { sign_in(user) }

  describe '.index' do
    before { get settings_about_index_path }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST create' do
    params = {
      profile_form: {
        about: 'some random text here',
        specialization: {
          item_1: 'something',
          item_2: 'something else',
          item_3: 'something different'
        }
      }
    }
    before { post '/settings/about', params: params, xhr: true }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end
end
