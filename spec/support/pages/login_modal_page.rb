# frozen_string_literal: true

require 'support/pages/user_page'
class LoginModalPage < UserPage
  def open
    visit url
    find('a.nav-link', text: 'Login').click
    sleep 0.4
  end
end
