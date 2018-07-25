# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Schedule Session Errors', type: :system do
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
  subject(:profile_page) { ProfilePage.new(profile_path(expert), user) }

  feature 'shows error when missing title' do
    before do
      profile_page.click_schedule_session
      request_page.fill_new_request_with request_params.except(:title)
    end

    it { expect(page.body).to include "Title can't be blank" }

    scenario 'successfully continue when title filled' do
      request_page.fill_missing_fields title: request_params[:title]
      request_page.confirm_new_request
      expect(page.body).to include expert.first_name, expert.last_name, request_params[:title]
    end
  end

  feature 'shows error when missing message' do
    before do
      profile_page.click_schedule_session
      request_page.fill_new_request_with request_params.except(:message)
    end

    it { expect(page.body).to include "Message can't be blank" }

    scenario 'successfully continue when message filled' do
      request_page.fill_missing_fields message: request_params[:message]
      request_page.confirm_new_request
      expect(page.body).to include expert.first_name, expert.last_name, request_params[:title]
    end
  end
end
