# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CitiesAndStatesFromCountry do
  let(:country) { 'United States' }
  let(:state) { 'Massachusetts' }
  let(:class_with_country) { described_class.new(country) }
  let(:class_with_country_and_state) { described_class.new(country, state) }

  describe '.initialize' do
    it { expect{ class_with_country }.not_to raise_exception  }
    it { expect{ class_with_country_and_state }.not_to raise_exception  }
  end

  describe '.states' do
    it { expect(class_with_country.states.to_s).to include state }
  end

  describe '.states' do
    it { expect(class_with_country_and_state.cities).not_to be_empty }
  end
end
