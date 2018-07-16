# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Settings Wallet', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let(:eth_address) { '0x222334909e528d7ae5994225736942ca38ac87b0' }
  let(:eth_address_params) do
    {
      public_key: eth_address
    }
  end

  subject(:settings_wallet_page) { Settings::WalletPage.new(settings_wallet_index_path, user) }

  feature 'Add Address' do
    before do
      settings_wallet_page.open
      settings_wallet_page.fill_and_submit_form 'eth_address', eth_address_params
      sleep 0.1
    end

    scenario 'shows address' do
      expect(page.body).to include eth_address
    end

    scenario 'set as default' do
      settings_wallet_page.set_as_default(eth_address)
      set_as_default_field = find('li', text: eth_address).all('span', text: 'Set as Default')
      expect(set_as_default_field).to be_empty
    end

    scenario 'delete address' do
      settings_wallet_page.delete(eth_address)
      expect(page.body).not_to include eth_address
    end
  end
end
