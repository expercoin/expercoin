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
      expercoin_rate: 0.0005
    }.with_indifferent_access
  end
  let(:profile_attributes) { profile.attributes.with_indifferent_access }

  describe 'GET index' do
    before { get settings_path }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'POST create' do
    before do
      post settings_path, params: { profile_form: update_params }
      profile.reload
    end
    it_behaves_like 'authenticated user'
    it { expect(contain_all?(profile_attributes, update_params)).to eq true }
  end
end
