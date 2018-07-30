# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home', type: :system do
  include_examples 'create user, profile'
  let!(:featured_service) { create(:service, :featured, owner: profile) }
  let!(:service) { create(:service, owner: profile, title: 'Some Not Featured Service Title') }

  subject(:home_page) { HomePage.new(root_url) }
  before(:each) { home_page.open }

  feature 'Find an expert' do
    before { home_page.find_an_expert }
    scenario 'shows service card' do
      expect(page.body).to include featured_service.title, profile.first_name, profile.last_name
    end
  end

  feature 'Share Expertise' do
    before { home_page.share_expertise }
    scenario 'goes to for mentros page' do
      expect(current_path).to eq for_mentors_path
    end
  end

  feature 'Popular Offers' do
    scenario 'shows only featured service card' do
      expect(page.body).to include featured_service.title, profile.first_name, profile.last_name
      expect(page.body).not_to include service.title
    end
  end
end
