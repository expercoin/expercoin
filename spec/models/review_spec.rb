# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { build(:review) }
  ASSOCIATIONS = [
    { model: :profile, association: 'belong_to' },
    { model: :author, association: 'belong_to' },
    { model: :request, association: 'belong_to' }
  ].freeze

  describe 'Factory' do
    it { expect(review).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of(:rate) }
    it { should validate_presence_of(:message) }
  end

  describe 'Associations' do
    ASSOCIATIONS.each do |obj|
      it { expect(review).to send(obj[:association], obj[:model]) }
    end
  end
end
