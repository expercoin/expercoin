# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }
  ASSOCIATIONS = [
    { model: :profile, association: 'have_one' },
    { model: :messages, association: 'have_many' },
    { model: :transactions, association: 'have_many' },
    { model: :assets, association: 'have_many' }
  ].freeze

  VALIDATIONS = [
    { validation: 'validate_presence_of', attr: :email },
    { validation: 'validate_presence_of', attr: :password }
  ].freeze

  describe 'Factory' do
    it { expect(user).to be_valid }
  end

  describe 'Validations' do
    VALIDATIONS.each do |obj|
      it { should send(obj[:validation], obj[:attr]) }
    end
  end

  describe 'Associations' do
    ASSOCIATIONS.each do |obj|
      it { expect(user).to send(obj[:association], obj[:model]) }
    end
  end
end
