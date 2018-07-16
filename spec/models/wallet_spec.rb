# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Wallet, type: :model do
  let(:wallet) { build(:wallet) }

  describe 'Factory' do
    it { expect(wallet).to be_valid }
  end

  describe 'Validations' do
  end

  describe 'Associations' do
    it { expect(wallet).to have_many(:eth_addresses) }
  end
end
