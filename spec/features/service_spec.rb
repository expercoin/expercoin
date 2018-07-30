# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Services', type: :system do
  include_examples 'create user, profile, categories'
  include_examples 'initialize service params'
  let!(:service) { create(:service, owner: profile) }

  feature 'New service' do
    subject(:service_page) { ServicePage.new(new_service_path, user) }
    before do
      service_page.fill_service_fields(service_params)
      service_page.click_view_service
    end
    scenario 'shows service details' do
      expect(page.body).to include 'Test service title', 'Test Service Content', 'First Tag'
    end
  end

  feature 'Edit service' do
    subject(:service_page) { ServicePage.new(edit_service_path(service), user) }
    before do
      service_page.fill_service_fields(service_params)
    end
    scenario 'shows new service params' do
      expect(page.body).to include 'Test service title', 'Test Service Content', 'First Tag'
    end
  end

  feature 'Meta Tags' do
    let!(:page_meta) { create(:page, :service, content: service) }

    subject(:service_page) { ServicePage.new(service_path(service), user) }
    before { service_page.open }
    scenario 'include meta tags in admin service page' do
      expect(page.body).to include page_meta.title, page_meta.description
    end
  end
end
