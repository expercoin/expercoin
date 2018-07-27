# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilesController, type: :request do
  let(:profile) { create(:profile) }

  describe 'GET show' do
    before { get profile_path(profile) }
    it_behaves_like 'loaded page'
  end

  describe 'GET show with invalid id' do
    before { get profile_path(123) }
    it { expect(response).to redirect_to profiles_path }
  end

  describe 'GET index' do
    before { get profiles_path }
    it_behaves_like 'loaded page'
  end
end
