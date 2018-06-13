# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileForm do
  let(:profile) { create(:profile) }
  let(:category_ids) do
    4.times { create(:category) }
    Category.all.map(&:id)
  end
  let(:profile_form) { ProfileForm.new(profile, category_ids: category_ids) }

  describe '.initialize' do
    it 'does rate conversion' do
      expect(profile_form.rate).to eq Eth::ValueFormatter.new(profile.rate).from_hex
    end
    it 'does expercoin rate conversion' do
      expect(profile_form.expercoin_rate).to eq Eth::ValueFormatter.new(profile.expercoin_rate).from_hex
    end
  end

  describe '.update_categories' do
    before { profile_form.update_categories(profile) }
    it 'should update categories succesfully' do
      profile_categories_ids = profile.categories.map(&:id)
      expect(profile_categories_ids).to eq category_ids
    end
  end
end
