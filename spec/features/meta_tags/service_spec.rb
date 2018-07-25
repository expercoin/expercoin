# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Meta Tags in Services', type: :system do
  let(:service) { create(:service) }
  let!(:page_meta) { create(:page, :service, content: service) }

  subject(:service_page) { ServicePage.new(service_path(service)) }

  feature 'Shows meta tags in head' do
    before { service_page.open }
    it { expect(page.body).to include page_meta.title, page_meta.description }
  end
end
