# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OauthController, type: :request do
  before(:each) do
    mock_auth_hash
  end

  after(:each) do
    OmniAuth.config.mock_auth[:linkedin] = nil
  end

  describe 'GET callback' do
    before { get oauth_callback_path('linkedin') }
    it { expect(OauthAccount.count).to eq 1 }
    it { expect(flash[:alert]).to be_nil }
    it { expect(User.last.email).to eq 'john@doe.com' } # email in mock
  end
end
