# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ValidUrl do
  let(:url) { '/profiles' }
  let(:domain) { 'http://localhost:3000' }
  let(:valid_url) { ValidUrl.new(url, domain) }

  describe '.initialize' do
    it { expect { valid_url }.not_to raise_error }
  end

  describe '.valid?' do
    it { expect(valid_url.valid?).to eq true }
  end

  describe '.valid_absolute_url' do
    let(:valid_url) { ValidUrl.new('http://localhost:3000/profiles', domain) }
    it { expect(valid_url.valid_absolute_url).to eq 'http://localhost:3000/profiles' }
  end

  describe 'when using https' do
    let(:valid_url) { ValidUrl.new('/', 'https://www.expercoin.com') }
    it { expect(valid_url.valid?).to eq true }
  end
end
