# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Get Started', type: :system do
  let(:user) { create(:user, :first_time) }
  let(:profile) { create(:profile, user: user) }

  subject(:get_started_page) { GetStartedPage.new(get_started_index_path, user) }

  feature 'go to dashboard' do
    before do
      get_started_page.open
      get_started_page.go_to_dashboard
    end
    it { expect(page.body).to include 'My Calls','My Requests' }
  end

  feature 'go to dashboard on close' do
    before do
      get_started_page.open
      get_started_page.close_modal_go_to_dashboard
    end
    it { expect(page.body).to include 'My Calls', 'My Requests' }
  end

  feature 'search and go to offers' do
    before do
      get_started_page.open
      get_started_page.search_offers('hello')
    end
    it { expect(page.body).to include 'Top Expercoin Offerings' }
  end

  feature 'go to create offer' do
    before do
      get_started_page.open
      get_started_page.go_to_create_offers
    end
    it { expect(page.body).to include 'Not rated', 'Save' }
  end
end
