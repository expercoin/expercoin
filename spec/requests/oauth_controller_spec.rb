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

  describe 'GET callback with rescue' do
    before do
      OmniAuth.config.mock_auth[:linkedin] = OmniAuth::AuthHash.new({
        'provider' => 'linkedin',
        'uid' => '123545',
        'info' => {
          'name' => 'mockuser',
          'image' => 'mock_user_thumbnail_url',
          'urls' => {
            'public_profile' => 'http://test.test/public_profile'
          }
        },
        'credentials' => {
          'token' => 'mock_token',
          'secret' => 'mock_secret'
        },
        'extra' => {
          'raw_info' => '{"json":"data"}'
        }
      }.with_indifferent_access)
      get oauth_callback_path('linkedin')
    end

    it { expect(flash[:alert]).not_to be_nil }
  end

  describe 'GET failure' do
    before { get oauth_failure_path }
    it { expect(flash[:alert]).not_to be_nil }
  end
end
