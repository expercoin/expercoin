# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registration', type: :system do
  let(:user_params) do
    {
      email: 'some-test@email.com',
      password: '123456',
      first_name: 'Joe',
      last_name: 'Doe'
    }
  end

  feature 'registration with modal' do
    it 'Log in successfully' do
      registration_page = RegistrationModalPage.new(root_path, user_params)
      registration_page.fill_and_submit_form
      expect(current_path).to eq dashboard_index_path
    end
  end

  feature 'registration with /signup route' do
    it 'Log in successfully' do
      registration_page = RegistrationPage.new(new_user_registration_path, user_params)
      registration_page.fill_and_submit_form
      expect(current_path).to eq dashboard_index_path
    end
  end
end
