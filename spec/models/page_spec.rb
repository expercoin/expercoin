# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Page, type: :model do
  let(:page) { build(:page) }
  let(:page_with_options) { build(:page, :with_default_options) }
  let(:page_service) { build(:page, :service) }

  describe 'Factory' do
    it { expect(page).to be_valid }
    it { expect(page_with_options).to be_valid }
    it { expect(page_service).to be_valid }
  end

  describe 'Validations' do
    it { expect(page).to validate_presence_of :url }
  end

  describe 'Assoccations' do
    it { expect(page).to belong_to :content }
  end
end
