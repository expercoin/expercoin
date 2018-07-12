# frozen_string_literal: true

class LoginModalPage < UserPage
  def open
    visit url
    find('a.nav-link', text: 'Login').click
    sleep 0.4
  end
end
