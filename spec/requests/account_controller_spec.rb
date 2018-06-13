# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountController, type: :request do
  describe 'GET index' do
    context "Logged in User" do
      it 'returns 200 OK status' do
        user = create(:user)
        sign_in(user)
        get account_index_path
        expect(response).to have_http_status(200)
      end

      it 'returns account path' do
        user = create(:user)
        sign_in(user)
        get account_index_path
        expect(request.path).to eq('/account')
      end
    end

    context "Visitor" do
      it 'returns 302 Status' do
        get account_index_path
        expect(response).to have_http_status(302)
      end

      it 'redirects to login page' do
        get account_index_path
        follow_redirect!
        expect(request.path).to eq('/login')
      end
    end
  end
end