# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Services', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let(:service) { create(:service, owner: profile) }
  let!(:categories) do
    3.times { create(:category, :with_parent, name: Faker::ProgrammingLanguage.name) }
    Category.children.map(&:name)
  end
  let(:service_params) do
    {
      title: 'Test service title',
      expercoin_rate: '10',
      content: 'Test Service Content',
      category: categories.second,
      tags: [ 'First', 'Second', 'Third' ]
    }
  end


  feature 'New service' do
    subject(:service_page) { ServicePage.new(new_service_path, user) }
    before do
      service_page.open
      service_page.fill_new_service_fields(service_params)
    end
    it { expect(page.body).to include 'Test service title' }
    it { expect(page.body).to include 'Test Service Content' }
  end
end
