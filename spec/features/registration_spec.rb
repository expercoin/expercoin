# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Registration', type: :system do
  include_examples 'user params'

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
