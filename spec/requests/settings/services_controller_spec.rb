# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Settings::ServicesController, type: :request do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let!(:logged_user) { sign_in(user) }
  let!(:service) { create(:service, owner: user) }

  describe '.index' do
    before { get settings_services_path }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end
end
