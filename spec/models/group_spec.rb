require 'rails_helper'

RSpec.describe Group, type: :model do
  let(:group) { build(:group) }
  let(:group_with_parent) { build(:group, :with_parent) }

  describe 'Factory' do
    it { expect(group).to be_valid }
    it { expect(group_with_parent).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of :title }
  end

  describe 'Associations' do
    it { expect(group).to belong_to :parent }
    it { expect(group).to have_many :groups }
    it { expect(group).to have_many :services }
  end
end
