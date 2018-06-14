# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchService do
  let!(:request) { create(:request, title: 'Test Request') }
  let(:collection) do
    5.times do
      create(:request)
    end
    Request.all
  end
  let(:search_service) { SearchService.new(collection, 'Test Request') }

  describe '.initialize' do
    it { expect { search_service }.not_to raise_error }
  end

  describe '.perform' do
    it 'should include request in results' do
      expect(search_service.perform).to include(request)
    end
  end
end
