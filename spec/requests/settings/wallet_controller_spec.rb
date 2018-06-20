# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Settings::WalletController, type: :request do
  let(:eth_address) { create(:eth_address) }
  let(:wallet) { eth_address.wallet }
  let(:user) { wallet.profile.user }
  let!(:logged_user) { sign_in(user) }

  describe 'GET index' do
    before { get settings_wallet_index_path }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'PATCH update' do
    before { patch settings_wallet_path(eth_address), xhr: true }
    it { expect(response).to have_http_status(:ok) }
    it_behaves_like 'authenticated user'
  end

  describe 'POST create' do
    before { post settings_wallet_index_path, params: { eth_address: attributes_for(:eth_address) }, xhr: true }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'DELETE destroy' do
    before { delete settings_wallet_path(eth_address), xhr: true }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end
end
