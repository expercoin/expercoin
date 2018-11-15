# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Request review', type: :system do
  include_examples 'create user, profile'
  let(:req) { create(:request, :selected_time_ten_minutes_ago, status: 'completed', requester: profile) }
  let(:expert) { req.expert }

  subject(:request_page) { RequestPage.new(request_path(req), user) }
  before(:each) { request_page.open }

  feature 'Create a new review' do
    before do
      request_page.click_to_rate(3)
      request_page.fill_form('review',
                             message: 'rgherherherh',
                             tx_hash: '0xf104a50a3f09444cf0a964e47378d3a8c6280179d76fd3825dca493ed1172374'
                            )
      page.execute_script("$('#review_tx_hash').val('0xf104a50a3f09444cf0a964e47378d3a8c6280179d76fd3825dca493ed1172374')");
      page.execute_script("$('input.hidden').click()");
    end

    it { expect(request_page.review_panel).to include 'rgherherherh', profile.first_name, profile.last_name }
  end
end
