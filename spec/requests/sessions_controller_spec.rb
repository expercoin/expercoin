# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SessionsController, type: :request do
  let(:user) { create(:user) }
  let(:email) { user.email }
  let(:password) { user.password }
  let(:logged_user) { sign_in(user) }
  let(:user_params) do
    {
      user: {
        email: email,
        password: password
      }
    }
  end

  describe '.create' do
    before { post user_session_path, params: user_params }
    it { expect(controller.current_user.email).to eq email }
    it { expect(flash[:notice]).to be_nil }
  end

  describe '.destroy' do
    before do
      logged_user
      delete destroy_user_session_path
    end
    it { expect(controller.current_user).to be_nil }
    it { expect(flash[:notice]).to be_nil }
  end
end
