# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :system do
  include_examples 'create user, profile'
  let(:user_params) do
    {
      email: user.email,
      password: user.password
    }
  end

  subject(:login_modal) { LoginModalPage.new(root_path) }

  feature 'login with modal' do
    it 'Log in successfully' do
      login_modal.open
      login_modal.fill_and_submit_form('user', user_params, 'Login')
      expect(current_path).to eq dashboard_index_path
    end
  end

  feature 'login with /login route' do
    it 'Log in successfully' do
      login_page = LoginPage.new(user)
      login_page.fill_and_submit_form
      expect(current_path).to eq dashboard_index_path
    end
  end
end
