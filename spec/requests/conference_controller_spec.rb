# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConferenceController, type: :request do
  let(:req) { create(:request, room_sid: 'RMf324f6bee76924fc4a4beaea9cc4c1ff') }
  let(:user) { req.expert.user }
  let!(:logged_user) { sign_in(user) }

  describe 'POST create' do
    before { post conference_index_path, params: { request_id: req.id } }
    it { expect(response).to redirect_to conference_path(req.room_sid) }
  end
end
