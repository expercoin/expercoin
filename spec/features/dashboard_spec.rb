# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Dashboard', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }

  subject(:dashboard_page) { DashboardPage.new(dashboard_index_path, user) }

  feature 'My Requests' do
    before { dashboard_page.click_my_request }
    it { expect(current_path).to eq requests_path }
  end

  feature 'My Calls' do
    before { dashboard_page.click_my_calls }
    it { expect(current_path).to eq calls_path }
  end

  feature 'Inbox' do
    before { dashboard_page.click_inbox }
    it { expect(current_path).to eq inbox_index_path }
  end
end
