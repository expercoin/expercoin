# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Message, type: :model do
  let(:message) { build(:message) }
  let(:message_with_parent) { build(:message, :with_parent) }

  describe 'Factory' do
    it { expect(message).to be_valid }
    it { expect(message_with_parent).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
  end

  describe 'Associations' do
    it { expect(message).to belong_to(:sender) }
    it { expect(message).to belong_to(:receiver) }
    it { expect(message).to belong_to(:parent) }
  end
end
