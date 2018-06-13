# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfilesController, type: :request do
  describe 'GET show' do
    it 'returns 200 OK status for an existing profile' do
      user = create(:user)
      profile = create(:profile, user: user)
      get profile_path(profile)
      expect(response).to have_http_status(200)
    end

    it 'redirects if no profile' do
      get profile_path(255)
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET index' do
    it 'returns 200 OK status' do
      get profiles_path
      expect(response).to have_http_status(200)
    end
  end
end
