# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dashboard User Verification', type: :system do
  include_examples 'create user, profile'

  subject(:dashboard_page) { DashboardPage.new(dashboard_index_path, user) }

  feature 'Shows message to create offer' do
    before { dashboard_page.open }
    it { expect(page.body).to include 'Create a New Offer' }
  end

  feature 'Shows message to connect with LinkedIn' do
    let!(:service) { create(:service, owner: profile, status: 'pending') }
    before { dashboard_page.open }
    it { expect(page.body).to include 'Verify Your Account With LinkedIn' }
  end

  feature 'Shows message to confirm email' do
    let!(:service) { create(:service, owner: profile, status: 'pending') }
    let(:user) { create(:user, :verified, profile: profile, confirmed_at: nil) }
    before { dashboard_page.open }
    it { expect(page.body).to include 'Confirm Your Email' }
  end

  feature 'Shows message to add eth address to wallet' do
    let!(:service) { create(:service, owner: profile, status: 'pending') }
    let(:user) { create(:user, :verified, profile: profile) }
    before do
      user.profile.wallet.eth_addresses.clear
      dashboard_page.open
    end
    it { expect(page.body).to include 'add your ETH Address to the wallet' }
  end

  feature 'Not showing message if completed profile' do
    let!(:service) { create(:service, owner: profile, status: 'pending') }
    let(:user) { create(:user, :verified, profile: profile) }
    before do
      dashboard_page.open
    end
    it { expect(page.body).not_to include 'alert-info' }
  end
end
