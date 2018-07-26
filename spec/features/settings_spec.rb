# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Settings', type: :system do
  include_examples 'create user, profile'
  include_examples 'settings params'
  include_examples 'location params'

  subject(:settings_page) { SettingsPage.new(settings_path, user) }

  feature 'save text fileds' do
    before do
      settings_page.open
      settings_page.fill_and_submit_form('profile_form', settings_params)
      visit current_path
    end
    it do
      params_saved = include_each?(page.body, settings_params.map(&:second))
      expect(params_saved).to eq true
    end
  end

  feature 'select location' do
    before do
      settings_page.open
      settings_page.select_location('profile_form', location_params)
      settings_page.open
    end
    it do
      params_saved = include_each?(page.body, location_params.map(&:second))
      expect(params_saved).to eq true
    end
  end
end
