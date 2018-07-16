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
      expercoin_rate: 400.0,
      rate: 372.0
    }.with_indifferent_access
  end
  let(:profile_attributes) { profile.attributes.with_indifferent_access }

  describe 'GET index' do
    before { get settings_path }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'POST create' do
    before do
      post settings_path, params: { profile_form: update_params, format: :js }
      profile.reload
    end
    it_behaves_like 'authenticated user'
    it { expect(contain_all?(profile_attributes, update_params.merge(expercoin_rate: 40_000, rate: 37_200))).to eq true }
  end

  describe 'GET states' do
    let(:states_params) { { country: 'United States' } }
    before { get states_settings_path, params: { profile_form: states_params }, xhr: true }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'GET states' do
    let(:cities_params) { { country: 'United States', state: 'Massachusetts' } }
    before { get cities_settings_path, params: { profile_form: cities_params }, xhr: true }
    it_behaves_like 'authenticated user get ok'
  end
end
