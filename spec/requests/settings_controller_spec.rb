# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SettingsController, type: :request do
  let(:profile) { create(:profile) }
  let!(:current_user) { sign_in(profile.user) }
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
    it 'should authenticate user' do
      expect(controller.authenticate_user!).not_to be_nil
    end
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST create' do
    before do
      post settings_path, params: { profile_form: update_params }
      profile.reload
    end
    it { expect(all_params_updated?).to eq true }
  end

  private

  def all_params_updated?
    profile_attributes.merge(update_params) == profile_attributes
  end
end
