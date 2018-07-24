# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Services Errors', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let!(:categories) do
    2.times { create(:category, :with_parent, name: Faker::ProgrammingLanguage.name) }
    Category.children.map(&:name)
  end
  let(:service_params) do
    {
      title: 'Test service title',
      expercoin_rate: '10',
      content: 'Test Service Content',
      category: categories.second,
      tags: ['First Tag', 'Second Tag', 'Third Tag']
    }
  end

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
