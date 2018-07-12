# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Settings', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let(:settings_params) do
    {
      first_name: 'Tom',
      last_name: 'Jerry',
      title: 'Hounter',
      expercoin_rate: 10.5,
      address: 'Home City'
    }
  end

  subject(:settings_page) { SettingsPage.new(settings_path, user) }

  feature 'save text fileds' do
    before do
      settings_page.fill_and_submit_form('profile_form', settings_params)
      visit current_path
    end
    it do
      params_saved = include_each?(page.body, settings_params.map(&:second))
      expect(params_saved).to eq true
    end
  end
end
