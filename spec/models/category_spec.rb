# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category) { create(:category) }
  ASSOCIATIONS = [
    { model: :profiles, association: 'have_and_belong_to_many' },
    { model: :categories, association: 'have_many' },
    { model: :parent, association: 'belong_to' }
  ].freeze

  describe 'Factory' do
    it { expect(category).to be_valid }
  end

  describe 'Validations' do
    it { should validate_presence_of(:name) }
  end

  describe 'Associations' do
    ASSOCIATIONS.each do |obj|
      it { expect(category).to send(obj[:association], obj[:model]) }
    end
  end

  describe 'Columns' do
    it { should have_db_column :slug }
    it { should have_db_column :banner }
  end

  describe 'Friendly find' do
    let(:find_category) { Category.friendly.find(category.id) }
    it { expect(find_category).not_to be_nil }
  end
end
