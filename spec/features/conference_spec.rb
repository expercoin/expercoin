# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Conference', type: :system do
  let(:profile) { create(:profile) }
  let(:req) { create(:request, :selected_time_ten_minutes_ago, requester: profile) }
  let(:user) { profile.user }
  let(:expert) { req.expert }
  let(:room) { MSP::Conference::Video.new.find_room(req.room_sid) }

  subject(:request_page) { RequestPage.new(request_path(req), user) }

  feature 'joins room' do
    before { request_page.join_room }
    it { expect(current_path).to eq conference_path(room.sid) }
  end

  feature 'send message' do
    subject(:conference_page) { ConferencePage.new(conference_path(req.room_sid)) }

    before do
      request_page.join_room
      conference_page.send_message('Hello New Message')
    end
    it { expect(page.body).to include 'Hello New Message' }
  end

  feature 'create room' do
    let(:req) { create(:request, :selected_time_ten_minutes_ago, status: 'verified', requester: profile) }
    before { request_page.create_room }
    it { expect(page.body).to include 'End Session' }
  end

  feature 'not showing create button with invalid time' do
    let(:req) { create(:request, :selected_time_ten_minutes_from_now, status: 'verified', requester: profile) }
    before { request_page.open }
    it { expect(page.body).not_to include 'Request Call' }
  end
end
