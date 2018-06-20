# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Transaction, type: :model do
  let(:transaction) { build(:transaction) }
  ASSOCIATIONS = [
    { model: :sender, association: 'belong_to' },
    { model: :receiver, association: 'belong_to' },
    { model: :parent, association: 'belong_to' },
    { model: :request, association: 'belong_to' }

  ].freeze

  describe 'Factory' do
    it { expect(transaction).to be_valid }
  end

  describe 'Validations' do
  end

  describe 'Associations' do
    ASSOCIATIONS.each do |obj|
      it { expect(transaction).to send(obj[:association], obj[:model]) }
    end
  end

  describe 'Enums' do
    it { should define_enum_for(:status).with(%i[pending completed]) }
  end
end
