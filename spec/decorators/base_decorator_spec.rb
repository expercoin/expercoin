# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BaseDecorator do
  let(:base_decorator) { BaseDecorator.new }

  describe '.initialize' do
    it { expect(base_decorator.is_a?(SimpleDelegator)).to eq true }
    it { expect(base_decorator.is_a?(BaseDecorator)).to eq true }
  end
end
