# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SettingsController, type: :request do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let!(:logged_user) { sign_in(user) }
  let(:update_params) do
    {
      first_name: 'Jon',
      last_name: 'Snow',
      title: 'King in the North',
      expercoin_rate: 500.0,
      rate: 400.0
    }.with_indifferent_access
  end

  describe 'GET index' do
    before { get settings_path }
    it_behaves_like 'loaded page', authenticated_user: true
  end

  describe 'POST create' do
    before do
      post settings_path, params: { profile_form: update_params, format: :js }
      profile.reload
    end
    it_behaves_like 'updated model',
                    model: Profile,
                    params: {
                      first_name: 'Jon',
                      last_name: 'Snow',
                      title: 'King in the North',
                      expercoin_rate: 50_000,
                      rate: 40_000
                    },
                    authenticated_user: true
  end

  describe 'GET states' do
    let(:states_params) { { country: 'United States' } }
    before { get states_settings_path, params: { profile_form: states_params }, xhr: true }
    it_behaves_like 'loaded page', authenticated_user: true
  end

  describe 'GET states' do
    let(:cities_params) { { country: 'United States', state: 'Massachusetts' } }
    before { get cities_settings_path, params: { profile_form: cities_params }, xhr: true }
    it_behaves_like 'loaded page', authenticated_user: true
  end
end
