# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Schedule Session', type: :system do
  include_examples 'create user, profile'
  let(:expert) { create(:profile) }
  let(:service) { create(:service, owner: expert) }
  include_examples 'initialize request params'

  subject(:request_page) { RequestPage.new }

  feature 'From Service' do
    subject(:service_page) { ServicePage.new(service_path(service), user) }

    before do
      service_page.click_schedule_session
      request_page.schedule_session_from_service
    end

    scenario 'creates request' do
      expect(page.body).to include expert.first_name, expert.last_name, service.title
    end
  end

  feature 'From Profile' do
    subject(:profile_page) { ProfilePage.new(profile_path(expert), user) }

    before do
      profile_page.click_schedule_session
      request_page.schedule_session_from_profile request_params
    end

    scenario 'create request' do
      expect(page.body).to include expert.first_name, expert.last_name, request_params[:title]
    end
  end
end
