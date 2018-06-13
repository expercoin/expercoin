# frozen_string_literal: true

require 'rails_helper'

RSpec.describe EthAddress, type: :model do
  let(:eth_address) { build(:eth_address) }

  describe 'Factory' do
    it { expect(eth_address).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of(:public_key) }
    it { should_not allow_value('0x123456789123456789').for(:public_key) }
    it { should allow_value('0x123456789123456789abcdefghijkl123456789a').for(:public_key) }
  end

  describe 'Associations' do
    it { expect(eth_address).to belong_to(:wallet) }
    # it { expect(eth_address).to have_many(:transactions) }
  end
end
