require 'rails_helper'

RSpec.describe Service, type: :model do
  let(:service) { create(:service) }
  let(:service_with_owner) { create(:service, :with_owner) }
  let(:featured_profile) { ServiceProvider.find_by(featured: true).profile }

  describe 'Factory' do
    it { expect(service).to be_valid }
    it { expect(service_with_owner).to be_valid }
  end

  describe 'Validations' do
    it { expect(service).to validate_presence_of :title }
    it { expect(service).to validate_presence_of :content }
    it { expect(service).to validate_presence_of :service_providers }
  end

  describe 'Associations' do
    it { expect(service).to have_many :profiles }
    it { expect(service).to have_many :service_providers }
    it { expect(service).to have_many :featured_service_providers }
    it { expect(service).to belong_to :category }
    it { expect(service).to belong_to :owner }
  end

  describe '.featured_profile' do
    it { expect(service.featured_profile).to eq featured_profile }
  end
end
