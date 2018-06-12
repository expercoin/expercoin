# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  describe 'Factory' do
    it 'has valid factory' do
      expect(user).to be_valid
    end
  end

  describe 'Validations' do
    it { should validate_presence_of(:email) }
    # it { should validate_uniqueness_of(:email) }
    it { should validate_presence_of(:password) }
  end

  describe 'Associations' do
    it { expect(user).to have_one(:profile) }
    it { expect(user).to have_many(:messages) }
    it { expect(user).to have_many(:transactions) }
  end
end
