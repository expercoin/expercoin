# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileForm do
  let(:profile) { create(:profile) }
  let(:category_ids) do
    4.times { create(:category) }
    Category.all.map(&:id)
  end
  let(:profile_form) { ProfileForm.new(profile, profile.location, category_ids: category_ids) }
  let(:profile_attributes) { profile.attributes }
  let(:profile_form_attributes) { profile.attributes }

  describe '.initialize' do
    it { expect(contain_all?(profile_attributes, profile_form_attributes)).to eq true }
  end

  describe '.update_categories' do
    before { profile_form.update_categories(profile) }
    it 'should update categories succesfully' do
      profile_categories_ids = profile.categories.map(&:id)
      expect(profile_categories_ids).to eq category_ids
    end
  end
end
