# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Login', type: :system do
  let(:admin_user) { create(:admin_user) }
  let!(:service) { create(:service) }
  let(:meta_tags) do
    {
      title: 'Some Title',
      name: 'Some Name',
      description: 'Some description',
      keywords: 'keyword1, keyword2, keyword3'
    }
  end

  feature 'List Services' do
    subject(:admin_service_page) { Admin::ServicePage.new(admin_services_path, admin_user) }
    before { admin_service_page.open }
    it { expect(page.body).to include service.title }
  end

  feature 'Show Service' do
    subject(:admin_service_page) { Admin::ServicePage.new(admin_service_path(service), admin_user) }
    before { admin_service_page.open }
    it { expect(page.body).to include service.title }
  end

  feature 'Add Meta Tags' do
    subject(:admin_service_page) { Admin::ServicePage.new(edit_admin_service_path(service), admin_user) }
    before do
      admin_service_page.open
      admin_service_page.add_new_meta_tags meta_tags
    end
    it { expect(page.body).to include meta_tags[:keywords] }
  end
end
