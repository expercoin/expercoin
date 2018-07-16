# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Settings Services', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let(:service) { create(:service, owner: profile) }

  subject(:settings_service_page) { Settings::ServicePage.new(settings_services_path, user) }

  feature 'Services' do
    before do
      service
      settings_service_page.open
    end

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
end
