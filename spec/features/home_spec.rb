# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Home', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let!(:featured_service) { create(:service, :featured, owner: profile) }
  let!(:service) { create(:service, owner: profile, title: 'Some Not Featured Service Title') }

  subject(:home_page) { HomePage.new(root_url) }
  before(:each) { home_page.open }

  feature 'Find an expert' do
    before { home_page.find_an_expert }
    it { expect(page.body).to include featured_service.title, profile.first_name, profile.last_name }
  end

  feature 'Share Expertise' do
    before { home_page.share_expertise }
    it { expect(current_path).to eq for_mentors_path }
  end

  feature 'Popular Offers' do
    it { expect(page.body).to include featured_service.title, profile.first_name, profile.last_name }
    it { expect(page.body).not_to include service.title }
  end
end
