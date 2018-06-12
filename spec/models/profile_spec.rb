# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Profile, type: :model do
  let(:profile) { create(:profile) }

  describe 'Factory' do
    it { expect(profile).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of(:first_name) }
    it { should validate_presence_of(:last_name) }
  end

  describe 'Associations' do
    it { expect(profile).to belong_to(:user) }
    it { expect(profile).to have_many(:reviews) }
    it { expect(profile).to have_many(:created_reviews) }
    it { expect(profile).to have_and_belong_to_many(:categories) }
    it { expect(profile).to have_many(:requests) }
  end
end
