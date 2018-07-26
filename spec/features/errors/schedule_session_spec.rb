# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Schedule Session Errors', type: :system do
  include_examples 'create user, profile'
  include_examples 'initialize request params'
  let(:expert) { create(:profile) }
  let(:service) { create(:service, owner: expert) }

  subject(:request_page) { RequestPage.new }
  subject(:profile_page) { ProfilePage.new(profile_path(expert), user) }

  feature 'shows error when missing title' do
    before do
      profile_page.click_schedule_session
      request_page.fill_new_request_with request_params.except(:title)
    end

    it_behaves_like 'schedule session continue after error', missing_field: :title, message: "Title can't be blank"
  end

  feature 'shows error when missing message' do
    before do
      profile_page.click_schedule_session
      request_page.fill_new_request_with request_params.except(:message)
    end

    it_behaves_like 'schedule session continue after error', missing_field: :message, message: "Message can't be blank"
  end
end
