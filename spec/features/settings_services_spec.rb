# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Settings Services', type: :system do
  include_examples 'create user, profile, service'

  let(:service_eth_price) { ServiceDecorator.new(service).display_rate }
  let(:service_usd_price) { ServiceDecorator.new(service).display_rate_in_usd }

  subject(:settings_service_page) { Settings::ServicePage.new(settings_services_path, user) }

  feature 'Services Actions' do
    scenario 'successfully click on new, edit and delete' do
      settings_service_page.open_new_service_page
      expect(current_path).to eq new_service_path
      settings_service_page.edit_service
      expect(current_path).to eq edit_service_path(service)
      settings_service_page.delete_service
      expect(page.body).not_to include service.title
    end
  end

  feature 'Service Values' do
    before { settings_service_page.open }
    scenario 'include service price and status' do
      expect(page.body).to include service_eth_price.to_s, "$#{service_usd_price}", service.status.titleize
    end
  end
end
