# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { build(:transaction) }

  describe 'Factory' do
    it { expect(transaction).to be_valid }
  end

  describe 'Validations' do
  end

  describe 'Associations' do
    it { expect(transaction).to belong_to(:sender) }
    it { expect(transaction).to belong_to(:receiver) }
    it { expect(transaction).to belong_to(:parent) }
    it { expect(transaction).to belong_to(:request) }
  end

  describe 'Enums' do
    it { should define_enum_for(:status).with(%i[pending completed]) }
  end
end
