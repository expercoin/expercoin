# frozen_string_literal: true

require 'support/pages/user_page'
module Admin
  class LoginPage
    include Capybara::DSL

    def initialize(admin_user)
      @admin_user = admin_user
    end

    def fill_and_submit_form
      visit '/admin/login'
      fill_in 'Email', with: @admin_user.email
      fill_in 'Password', with: @admin_user.password
      click_on 'Login'
    end
  end
end
