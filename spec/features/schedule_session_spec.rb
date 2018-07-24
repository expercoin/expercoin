# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Schedule Session', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let(:expert) { create(:profile) }
  let(:service) { create(:service, owner: expert) }
  let(:request_params) do
    {
      title: 'Some test request title',
      message: 'Some test request message'
    }
  end

  subject(:request_page) { RequestPage.new }

  feature 'From Service' do
    subject(:service_page) { ServicePage.new(service_path(service), user) }

    before do
      service_page.click_schedule_session
      request_page.fill_new_request
      request_page.confirm_new_request
    end

    scenario 'creates request' do
      expect(page.body).to include expert.first_name, expert.last_name, service.title
    end
  end

  feature 'From Profile' do
    subject(:profile_page) { ProfilePage.new(profile_path(expert), user) }

    before do
      profile_page.click_schedule_session
      request_page.fill_new_request_with request_params
      request_page.confirm_new_request
    end

    scenario 'create request' do
      expect(page.body).to include expert.first_name, expert.last_name, request_params[:title]
    end
  end
end
