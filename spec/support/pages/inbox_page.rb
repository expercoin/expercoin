# frozen_string_literal: true

require 'support/pages/user_page'
class InboxPage < UserPage
  def click_details
    visit url
    click_on 'Details'
    sleep 0.1
  end
end
