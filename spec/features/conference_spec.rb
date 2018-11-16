# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Conference', type: :system do
  include_examples 'create user, profile'
  let(:req) do
    req = build(:request, :selected_time_ten_minutes_ago, requester: profile)
    req.save validate: false
    req
  end
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
end
