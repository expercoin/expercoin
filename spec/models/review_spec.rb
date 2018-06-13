# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:review) { build(:review) }

  describe 'Factory' do
    it { expect(review).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of(:rate) }
    it { should validate_presence_of(:message) }
  end

  describe 'Associations' do
    it { expect(review).to belong_to(:profile) }
    it { expect(review).to belong_to(:author) }
    it { expect(review).to belong_to(:request) }
  end
end
