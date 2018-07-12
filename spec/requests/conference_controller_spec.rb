# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConferenceController, type: :request do
  let(:req) { create(:request, :inprogress) }
  let(:room) { MSP::Conference::Video.new.find_room(req.room_sid) }
  let(:user) { req.expert.user }
  let!(:logged_user) { sign_in(user) }

  describe 'POST create with room_sid' do
    before { post conference_index_path, params: { request_id: req.id } }
    it { expect(response).to redirect_to conference_path(req.room_sid) }
  end

  describe 'POST create without room_sid' do
    let(:req) { create(:request, :verified, room_sid: nil) }
    before do
      post conference_index_path, params: { request_id: req.id }
      req.reload
    end
    it { expect(response).to redirect_to conference_path(req.room_sid) }
    it { expect(req.status).to eq 'inprogress' }
    it { expect(req.invitee).to eq true }
  end

  describe 'DELETE destroy' do
    let(:req) { create(:request, :inprogress, room_sid: 'RM1cfdb11a479b2f061fb498e416a08d8f') }
    before do
      delete conference_path(req.room_sid)
      req.reload
    end
    it { expect(req.status).to eq 'completed' }
    it { expect(req.ended_at).not_to be_nil }
    it { expect(room.status).to eq 'completed' }
    it { expect(response).to redirect_to call_path(req) }
  end

  describe 'GET show' do
    let(:req) do
      create(:request, :inprogress,
             room_sid: 'RMe1491f9d09795f0ee843879b8eb92c17',
             started_at: nil,
             inviter: true)
    end
    before { get conference_path(req.room_sid) }
    it { expect(response).to have_http_status(:ok) }
  end

  # describe 'PATCH update' do
  #   before { patch conference_path(req.room_sid) }
  #   it { expect(response).to have_http_status(:ok) }
  # end
end
