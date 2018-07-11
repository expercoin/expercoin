# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notifications::Create do
  let(:user) { create(:user) }
  let(:request) { create(:request) }
  let(:params) { { user_id: user.id, resource_type: 'Request', resource_id: request.id, type: :new } }
  let(:notification) { described_class.new(params) }

  describe '.initialize' do
    it { expect { notification }.not_to raise_error }
  end

  describe '.perform' do
    it { expect(notification.perform.class.name).to eq 'Notification' }
    it { expect(notification.perform.resource).to eq request }
    it { expect(notification.perform.user).to eq user }
  end
end
