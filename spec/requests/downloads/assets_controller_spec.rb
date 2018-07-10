# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Downloads::AssetsController, type: :request do
  let(:asset) { create(:asset) }
  let(:user) { asset.resource.receiver } # asset.resource is message
  let(:profile) { user.profile }
  let!(:signed_user) { sign_in(user) }

  describe 'GET show' do
    before { get downloads_asset_path(asset) }
    it_behaves_like 'authenticated user get ok'
  end
end
