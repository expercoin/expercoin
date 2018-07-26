# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Services Errors', type: :system do
  include_examples 'create user, profile, categories'
  include_examples 'initialize service params'

  feature 'New Service' do
    subject(:service_page) { ServicePage.new(new_service_path, user) }
    before { service_page.open }

    scenario 'Without title' do
      service_page.fill_service_fields(service_params.except(:title))
      expect(page.body).to include "Title can't be blank"
      service_page.fill_service_fields(service_params)
      service_page.click_view_service
      expect(page.body).to include service_params[:title]
    end

    scenario 'Without content' do
      service_page.fill_service_fields(service_params.except(:content))
      expect(page.body).to include "Content can't be blank"
      service_page.fill_service_fields(service_params)
      service_page.click_view_service
      expect(page.body).to include service_params[:title]
    end
  end
end
