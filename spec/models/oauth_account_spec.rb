# frozen_string_literal: true

require 'rails_helper'

RSpec.describe OauthAccount, type: :model do
  let(:oauth_account) { build(:oauth_account) }

  describe 'Factory' do
    it { expect(oauth_account).to be_valid }
  end

  describe 'Association' do
    it { expect(oauth_account).to belong_to :user }
  end
end
