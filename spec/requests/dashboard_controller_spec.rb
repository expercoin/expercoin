# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DashboardController, type: :request do
  describe '.index' do
    context 'when logged out' do
      before { get dashboard_index_path }
      it { expect(response).to have_http_status(:redirect) }
    end
    context 'when logged in' do
      let!(:user) { sign_in(create(:user)) }
      before { get dashboard_index_path }
      it { expect(response).to have_http_status(:ok) }
    end
  end
end
