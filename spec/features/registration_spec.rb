# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registration', type: :system do
  let(:user_params) do
    {
      first_name: 'Joe',
      last_name: 'Doe',
      email: 'some-test@email.com',
      password: '123456',
      password_confirmation: '123456'
    }
  end

  feature 'registration with modal' do
    subject(:registration_page) { RegistrationModalPage.new(root_path) }
    before do
      registration_page.open
      registration_page.fill_and_submit_form 'user', user_params, 'Sign Up'
    end
    it { expect(current_path).to eq get_started_index_path }
  end

  feature 'registration with /signup route' do
    subject(:registration_page) { RegistrationPage.new(new_user_registration_path) }
    before do
      registration_page.open
      registration_page.fill_and_submit_form 'user', user_params, 'Sign up'
    end
    it { expect(current_path).to eq get_started_index_path }
  end
end
