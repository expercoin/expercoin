# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ValidUrl do
  let(:url) { 'legal/terms-of-use' }
  let(:domain) { 'https://www.expercoin.com' }
  let(:valid_url) { ValidUrl.new(url, domain) }

  describe '.initialize' do
    it { expect { valid_url }.not_to raise_error }
  end

  describe '.valid?' do
    it { expect(valid_url.valid?).to eq true }
  end

  describe '.valid_absolute_url' do
    let(:valid_url) { ValidUrl.new('https://www.expercoin.com/legal/terms-of-use', domain) }
    it { expect(valid_url.valid_absolute_url).to eq 'https://www.expercoin.com/legal/terms-of-use' }
  end
end
