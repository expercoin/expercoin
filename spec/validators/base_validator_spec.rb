# frozen_string_literal: true

require 'rails_helper'

RSpec.describe BaseValidator do
  let(:base_validator) { BaseValidator.new }

  describe '.initialize' do
    it { expect(base_validator.is_a?(ActiveModel::Validations)).to eq true }
    it { expect(base_validator.is_a?(BaseValidator)).to eq true }
  end
end
