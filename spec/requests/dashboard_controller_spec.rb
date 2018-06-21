# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :request do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let!(:logged_user) { sign_in(user) }

  describe 'GET index' do
    before { get dashboard_index_path }
    it_behaves_like 'authenticated user get ok'
  end
end
