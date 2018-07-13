# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Conference', type: :system do
  let(:profile) { create(:profile) }
  let(:req) { create(:request, :inprogress, requester: profile) }
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
    let(:req) { create(:request, :verified, requester: profile, room_sid: 'RMe1491f9d09795f0ee843879b8eb92c17') }
    before { request_page.create_room }
    it { expect(page.body).to include 'End Session' }
  end
end
