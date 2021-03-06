# frozen_string_literal: true

require 'support/pages/user_page'
class LoginPage
  include Capybara::DSL

  def initialize(user)
    @user = user
  end

  def fill_and_submit_form
    visit '/login'
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Login'
  end
end
