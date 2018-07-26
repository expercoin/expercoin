# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Settings::AuthenticateController, type: :request do
  let(:user) { create(:user) }
  let!(:logged_user) { sign_in(user) }

  describe 'GET index' do
    before { get settings_authenticate_index_path }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end
end
