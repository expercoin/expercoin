# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Conference', type: :system do
  let(:profile) { create(:profile) }
  let(:req) { create(:request, :selected_time_ten_minutes_ago, status: 'verified', requester: profile) }
  let(:user) { profile.user }
  let(:expert) { req.expert }

  subject(:request_page) { RequestPage.new(request_path(req), user) }

  feature 'create room' do
    before { request_page.create_room }
    it { expect(page.body).to include 'End Session' }
  end

  feature 'not showing create button with invalid time' do
    let(:req) { create(:request, :selected_time_ten_minutes_from_now, status: 'verified', requester: profile) }
    before { request_page.open }
    it { expect(page.body).not_to include 'Request Call' }
  end

  feature 'shows create button with valid time' do
    before { request_page.open }
    it { expect(page.body).to include 'Request Call' }
  end

  feature 'shows create button even if user has not refershed page' do
    let(:req) { create(:request, :selected_time_fives_seconds_from_now, status: 'verified', requester: profile) }
    before do
      request_page.open
      sleep 5
    end
    it { expect(page.body).to include 'Request Call' }
  end
end
