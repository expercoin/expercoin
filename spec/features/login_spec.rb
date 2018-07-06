# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }

  feature 'login on home page' do
    it 'Log in successfully' do
      login_page = LoginModalPage.new(root_path, user)
      login_page.fill_and_submit_form
      expect(current_path).to eq dashboard_index_path
    end
  end
end
