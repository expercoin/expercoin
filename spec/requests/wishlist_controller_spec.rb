# frozen_string_literal: true

require 'rails_helper'

RSpec.describe WishlistController, type: :request do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let!(:logged_user) { sign_in(user) }
  let(:service) { create(:service) }
  let(:wishlist) { create(:wishlist, profile: profile, service: service) }
  # let(:wishlist_params) do
  #   {
  #     service_id: service.id
  #   }
  # end

  describe 'GET index' do
    before { get wishlist_index_path }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'POST create' do
    before { post wishlist_create_path(service), xhr: true }
    it_behaves_like 'authenticated user'
    it { expect(profile.wishlisted_services.count).to eq 1 }
  end

  describe 'POST create with existing wishlist' do
    before do
      wishlist
      post wishlist_create_path(service), xhr: true
    end
    it { expect(profile.wishlisted_services.count).to eq 0 }
  end
end
