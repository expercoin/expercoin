require 'rails_helper'

RSpec.describe Service, type: :model do
  let(:service) { create(:service) }

  describe 'Factory' do
    it { expect(service).to be_valid }
  end

  describe 'Validations' do
    # it { expect(service).to validate_presence_of :title }
    # it { expect(service).to validate_presence_of :content }
  end

  describe 'Associations' do
    it { expect(service).to belong_to :category }
    it { expect(service).to belong_to :owner }
  end
end
