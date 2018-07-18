# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Request', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let(:request) { create(:request, :selected_time_in_ten_minutes, requester: profile, status: 'verified') }

  subject(:request_page) { RequestPage.new(request_path(request), user) }
  feature 'shows create room button' do
    before do
      Time.zone = 'Eastern Time (US & Canada)'
    end
    pending 'tests for show button'
  end
end
