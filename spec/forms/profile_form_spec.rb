# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileForm do
  let(:profile) { create(:profile) }
  let(:category_ids) do
    4.times { create(:category) }
    Category.all.map(&:id)
  end
  let(:profile_form) { ProfileForm.new(profile, profile.location, category_ids: category_ids) }

  describe '.initialize' do
    it { expect(profile_form.first_name).to eq profile.first_name }
    it { expect(profile_form.last_name).to eq profile.last_name }
    it { expect(profile_form.name).to eq profile.name }
    it { expect(profile_form.title).to eq profile.title }
    it { expect(profile_form.professional_role).to eq profile.professional_role }
    it { expect(profile_form.years_of_experience).to eq profile.years_of_experience }
    it { expect(profile_form.photo_url).to eq profile.photo_url }
    it { expect(profile_form.rate).to eq profile.rate }
    it { expect(profile_form.expercoin_rate).to eq profile.expercoin_rate }
    it { expect(profile_form.country).to eq profile.country }
    it { expect(profile_form.state).to eq profile.state }
    it { expect(profile_form.city).to eq profile.city }
    it { expect(profile_form.zip_code).to eq profile.zip_code }
    it { expect(profile_form.about).to eq profile.about }
    it { expect(profile_form.category_ids).to eq category_ids }
    it { expect(profile_form.specialization).to eq profile.specialization }
  end

  describe '.update_categories' do
    before { profile_form.update_categories(profile) }
    it 'should update categories succesfully' do
      profile_categories_ids = profile.categories.map(&:id)
      expect(profile_categories_ids).to eq category_ids
    end
  end
end
