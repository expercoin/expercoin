# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Admin Login', type: :system do
  let(:admin_user) { create(:admin_user) }

  feature 'login with /admin/login route' do
    it 'Log in successfully' do
      login_page = AdminLoginPage.new(admin_user)
      login_page.fill_and_submit_form
      expect(current_path).to eq admin_dashboard_path
    end
  end
end
