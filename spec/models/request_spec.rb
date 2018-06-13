require 'rails_helper'

RSpec.describe Request, type: :model do
  let(:request) { build(:request) }

  describe 'Factory' do
    it { expect(request).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:message) }
    it { should validate_presence_of(:requested_length) }
    it { should validate_presence_of(:first_date) }
    it { should validate_presence_of(:first_time) }
    it { should validate_presence_of(:second_date) }
    it { should validate_presence_of(:second_time) }
    it { should validate_presence_of(:third_date) }
    it { should validate_presence_of(:third_time) }
    it { should validate_presence_of(:cell_number) }
  end

  describe 'Associations' do
    it { expect(request).to belong_to(:requester) }
    it { expect(request).to belong_to(:expert) }
    it { expect(request).to belong_to(:updated_by) }
    it { expect(request).to have_one(:review) }
    it { expect(request).to have_many(:eth_transactions) }
  end
end
