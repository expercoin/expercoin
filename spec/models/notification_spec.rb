# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Notification, type: :model do
  let(:notification_request) { build(:notification, :request) }
  let(:notification_message) { build(:notification, :message) }

  describe 'Factory' do
    it { expect(notification_request).to be_valid }
    it { expect(notification_message).to be_valid }
  end

  describe 'Assoccations' do
    it { expect(notification_request).to validate_presence_of :title }
  end
end
