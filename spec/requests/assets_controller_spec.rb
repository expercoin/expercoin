# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AssetsController, type: :request do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let!(:signed_user) { sign_in(user) }
  let(:asset_params) do
    {
      file: fixture_file_upload("#{Rails.root}/public/images/expercoin_logo.png")
    }
  end

  describe 'POST create' do
    before { post assets_path, params: { asset: asset_params }, xhr: true }
    it_behaves_like 'authenticated user'
    it { expect(Asset.count).to eq 1 }
  end
end
