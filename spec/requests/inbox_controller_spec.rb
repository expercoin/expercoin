# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InboxController, type: :request do
  let!(:users) { create_list(:user, 3) }
  let!(:message) { create(:message) }

  context 'when logged out' do
    describe '.index' do
      before { get inbox_index_path }
      it { expect(response).to have_http_status(:redirect) }
    end
    describe '.show' do
      before { get inbox_path(message) }
      it { expect(response).to have_http_status(:redirect) }
    end
    describe '.all_inbox' do
      before { get all_inbox_index_path }
      it { expect(response).to have_http_status(:redirect) }
    end
  end

  context 'when logged in' do
    let!(:user) { sign_in(users.second) }
    describe '.index' do
      before { get inbox_index_path }
      it { expect(response).to have_http_status(:ok) }
    end
    describe '.show' do
      before { get inbox_path(message.id) }
      it { expect(response).to have_http_status(:ok) }
    end
    describe '.all_inbox' do
      before { get all_inbox_index_path }
      it { expect(response).to have_http_status(:ok) }
    end
  end
end
