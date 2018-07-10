require 'rails_helper'

RSpec.describe Asset, type: :model do
  let(:asset) { build(:asset) }

  describe 'Factory' do
    it { expect(asset).to be_valid }
  end

  describe 'Associations' do
    it { expect(asset).to belong_to :resource }
  end

  describe 'Validations' do
    it { expect(asset).to validate_presence_of :name }
    it { expect(asset).to validate_presence_of :file }
  end
end
