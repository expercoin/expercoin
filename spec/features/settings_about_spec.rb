# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Settings About', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let(:settings_params) do
    {
      about: 'Some info about me'
    }
  end

  subject(:settings_about_page) { Settings::AboutPage.new(settings_about_index_path, user) }

  # feature 'About info' do
  #   before do
  #     settings_about_page.open
  #     settings_about_page.fill_about 'Some info about me'
  #     settings_about_page.submit_form
  #     settings_about_page.open
  #   end
  #   it { expect(page.body).to include 'Some info about me' }
  # end

  feature 'Specializations' do
    before do
      settings_about_page.open
      settings_about_page.click_on_add(2)
      settings_about_page.add_specializations 'Blockchain', 'Solidity', 'Mentoring', 'Crypto', 'Dollary'
      settings_about_page.submit_form
      settings_about_page.open
    end
    it do
      expect(page.body).to include 'Blockchain', 'Solidity', 'Mentoring', 'Crypto', 'Dollary'
    end
  end
end
