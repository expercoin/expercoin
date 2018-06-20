# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Calls::HistoryController, type: :request do
  let(:user) { create(:user) }
  let!(:logged_user) { sign_in(user) }

  describe '.index' do
    before { get calls_history_index_path }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end
end
