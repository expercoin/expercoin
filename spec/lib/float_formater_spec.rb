# frozen_string_literal: true

require 'rails_helper'

RSpec.describe FloatFormater do
  let(:formated_number) { 0.0001 }
  let(:long_formated_number) { 0.0000133 }
  let(:unformated_number) { 0.000434341 }
  let(:formated_number_instance) { FloatFormater.new(formated_number) }
  let(:long_formated_number_instance) { FloatFormater.new(long_formated_number) }
  let(:unformated_number_instance) { FloatFormater.new(unformated_number) }

  describe '.initialize' do
    it { expect { formated_number_instance }.not_to raise_error }
  end

  describe 'returns passed value if correct format' do
    it { expect(formated_number_instance.with_dots).to eq 0.0001 }
  end

  describe 'returns passed Euler number formated value if correct format' do
    it { expect(long_formated_number_instance.with_dots).to eq 1.33e-05 }
  end

  describe 'returns formated value' do
    it { expect(unformated_number_instance.with_dots).to eq '0.00043...' }
  end
end
