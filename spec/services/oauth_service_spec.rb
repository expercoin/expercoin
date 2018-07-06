# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OauthService do
  before(:each) { mock_auth_hash }
  let(:auth_hash) { OmniAuth.config.mock_auth[:linkedin] }
  let(:oauth_service) { OauthService.new(auth_hash) }

  describe '.initialize' do
    it { expect{ oauth_service }.not_to raise_exception  }
  end

  describe '.create_oauth_account' do
    before { oauth_service.create_oauth_account! }
    it { expect(OauthAccount.count).to eq 1 }
    it { expect(User.count).to eq 1 }
    it { expect(Profile.count).to eq 1 }
  end
end
