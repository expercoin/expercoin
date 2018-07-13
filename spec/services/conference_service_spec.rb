# frozen_string_literal: true

require 'rails_helper'

RSpec.describe  ConferenceService do
  let(:request) { create(:request) }
  let(:request_verified) { create(:request, :verified) }
  let(:request_inprogress) { create(:request, :inprogress) }
  let(:client) { request_verified.requester.user }
  let(:expert) { request_verified.expert.user }
  let(:client_inprogress) { request_inprogress.requester.user }
  let(:expert_inprogress) { request_inprogress.expert.user }
  let(:user) { create(:user) }

  let(:client_service) { described_class.new(request_verified, client) }
  let(:expert_service) { described_class.new(request_verified, expert) }
  let(:client_service_inprogress) { described_class.new(request_inprogress, client_inprogress) }
  let(:expert_service_inprogress) { described_class.new(request_inprogress, expert_inprogress) }
  let(:fail_user_service) { described_class.new(request, user) }

  describe '.initialize' do
    it { expect { client_service }.not_to raise_exception  }
    it { expect { expert_service }.not_to raise_exception  }
  end

  describe '.initialize to fail with wrong user' do
    it { expect { fail_user_service }.to raise_exception }
  end

  describe '.raise_error_if_room_closed' do
    it { expect { client_service.raise_error_if_room_closed }.not_to raise_exception  }
    it { expect { expert_service.raise_error_if_room_closed }.not_to raise_exception  }
  end

  describe '.create with correct params' do
    it { expect(client_service.create).to eq "/conference/#{request_verified.room_sid}" }
    it { expect(expert_service.create).to eq "/conference/#{request_verified.room_sid}" }
  end

  describe '.create with alrady inprogress params' do
    it { expect(client_service_inprogress.create).to eq "/conference/#{request_inprogress.room_sid}" }
    it { expect(expert_service_inprogress.create).to eq "/conference/#{request_inprogress.room_sid}" }
  end

  describe '.visit_setup' do
    before do
      request_inprogress.update(invitee: true, inviter: true, started_at: nil)
    end

    it { expect(client_service_inprogress.visit_setup).to be true }
  end

  describe '.visit_setup no changes' do
    before do
      request_inprogress.update(invitee: true, inviter: true, started_at: Time.now)
    end

    it { expect(client_service_inprogress.visit_setup).to be nil }
  end

  describe '.destroy return correct path' do
    let(:request_inprogress) { create(:request, :inprogress, room_sid: 'RM1cfdb11a479b2f061fb498e416a08d8f') }
    before do
      request_inprogress.update(invitee: true, inviter: true, started_at: Time.now)
    end

    it { expect(expert_service_inprogress.destroy).to eq "/calls/#{request_inprogress.id}" }
    it { expect(client_service_inprogress.destroy).to eq "/requests/#{request_inprogress.id}" }
  end
end
