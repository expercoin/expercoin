# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MSP::Conference::Video do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let(:conference_video) { MSP::Conference::Video.new }
  let(:room_sid) { conference_video.create_room }
  let(:room) { conference_video.find_room(room_sid) }
  let(:access_token) { conference_video.access_token(user.email, room_sid) }

  describe '.initialize' do
    it { expect { conference_video }.not_to raise_error }
  end

  describe '.call' do
  end

  describe '.generate_access_token' do
    it { expect(conference_video.generate_access_token).not_to be_nil }
  end

  describe '.grant_access_to_video' do
    it { expect(conference_video.grant_access_to_video(room_sid)).to be_present }
  end

  describe '.access_token' do
    it { expect(access_token.length).to be > 400 }
  end

  describe '.create_room' do
    it { expect(room_sid).to be_present }
  end

  describe '.find_room' do
    it { expect(room).not_to be_nil }
  end

  describe '.room_closed?' do
    before { conference_video.kill_room(room_sid) }
    it { expect(conference_video.room_closed?(room_sid)).to be true }
  end

  describe '.kill_room' do
    before { conference_video.kill_room(room_sid) }
    it { expect(room.status).to eq 'completed' }
  end
end
