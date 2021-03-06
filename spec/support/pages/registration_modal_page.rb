# frozen_string_literal: true

require 'support/pages/user_page'
class RegistrationModalPage < UserPage
  def open
    visit url
    find('a.nav-link', text: 'Sign up').click
    sleep 0.4
  end
end
