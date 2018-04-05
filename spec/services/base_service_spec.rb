# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BaseService do
  let(:base_service) { BaseService.new }

  describe '.initalize' do
    it 'can initialize new instance' do
      expect(base_service.is_a?(BaseService)).to eq true
    end
  end
end
