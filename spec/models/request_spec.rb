# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Request, type: :model do
  let(:request) { build(:request) }
  let(:request_pending) { build(:request, :pending) }
  let(:request_accepted) { build(:request, :accepted) }
  let(:request_verifying) { build(:request, :verifying) }
  let(:request_verified) { build(:request, :verified) }
  let(:request_inprogress) { build(:request, :inprogress) }
  let(:request_completed) { build(:request, :completed) }

  describe 'Factory' do
    it { expect(request).to be_valid }
    it { expect(request_pending).to be_valid }
    it { expect(request_accepted).to be_valid }
    it { expect(request_verifying).to be_valid }
    it { expect(request_verified).to be_valid }
    it { expect(request_inprogress).to be_valid }
    it { expect(request_completed).to be_valid }
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
    it { expect(request).to have_many(:reviews) }
    it { expect(request).to have_many(:eth_transactions) }
  end
end
