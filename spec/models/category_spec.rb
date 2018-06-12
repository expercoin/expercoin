require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { build(:category) }
  let(:category_with_banner) { build(:category, :with_banner) }

  describe 'Factory' do
    it { expect(category).to be_valid }
    it { expect(category_with_banner).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Associations' do
    it { expect(category).to have_and_belong_to_many(:profiles) }
  end
end
