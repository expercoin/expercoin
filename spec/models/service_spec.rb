# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Service, type: :model do
  let(:service) { create(:service) }

  describe 'Factory' do
    it { expect(service).to be_valid }
  end

  describe 'Validations' do
  end

  describe 'Associations' do
    it { expect(service).to belong_to :category }
    it { expect(service).to belong_to :owner }
  end
end
