# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Services', type: :system do
  include_examples 'create user, profile, categories'
  include_examples 'initialize service params'

  feature 'New service' do
    subject(:service_page) { ServicePage.new(new_service_path, user) }
    before do
      create(:service, owner: profile)
      service_page.open
      service_page.fill_service_fields(service_params)
      service_page.click_view_service
    end
    it { expect(page.body).to include 'Test service title', 'Test Service Content', 'First Tag' }
  end

  feature 'Edit service' do
    let(:service) { create(:service, owner: profile) }
    subject(:service_page) { ServicePage.new(edit_service_path(service), user) }
    before do
      service_page.open
      service_page.fill_service_fields(service_params)
    end
    it { expect(page.body).to include 'Test service title', 'Test Service Content', 'First Tag' }
  end

  feature 'Meta Tags' do
    let(:service) { create(:service, owner: profile) }
    let!(:page_meta) { create(:page, :service, content: service) }

    subject(:service_page) { ServicePage.new(service_path(service), user) }
    before { service_page.open }
    it { expect(page.body).to include page_meta.title, page_meta.description }
  end
end
