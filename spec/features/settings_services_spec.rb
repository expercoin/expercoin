# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Settings Services', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let!(:service) { create(:service, owner: profile) }
  let(:service_eth_price) { ServiceDecorator.new(service).display_rate }
  let(:service_usd_price) { ServiceDecorator.new(service).display_rate_in_usd }

  subject(:settings_service_page) { Settings::ServicePage.new(settings_services_path, user) }

  feature 'Services Actions' do
    before { settings_service_page.open }

    scenario 'Opens new service page' do
      settings_service_page.open_new_service_page
      expect(current_path).to eq new_service_path
    end

    scenario 'Opens edit service page' do
      settings_service_page.edit_service
      expect(current_path).to eq edit_service_path(service)
    end

    scenario 'Delete service' do
      settings_service_page.delete_service
      expect(page.body).not_to include service.title
    end
  end

  feature 'Service Values' do
    before { settings_service_page.open }
    it { expect(page.body).to include service_eth_price.to_s }
    it { expect(page.body).to include "$#{service_usd_price}" }
    it { expect(page.body).to include service.status.titleize }
  end
end
