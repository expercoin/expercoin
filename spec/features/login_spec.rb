# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }

  feature 'login on home page' do
    it 'Log in successfully' do
      visit root_path
      find('a.nav-link', text: 'Login').click
      sleep 0.5
      fill_in 'Email Address', with: user.email
      sleep 0.5
      fill_in 'Password', with: user.password
      sleep 0.5
      click_on 'Login'
      sleep 0.5
      expect(current_path).to eq dashboard_index_path
    end
  end
end
