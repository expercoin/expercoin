# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServiceProvider, type: :model do
  let!(:service_provider) { build(:service_provider) }
  let(:featured_count) { ServiceProvider.where(featured: true).count }

  describe 'Factory' do
    it { expect(service_provider).to be_valid }
  end

  describe 'Associations' do
    it { expect(service_provider).to belong_to :service }
    it { expect(service_provider).to belong_to :profile }
  end

  describe 'Scopes' do
    it { expect(described_class.featured.count).to eq featured_count }
  end
end
