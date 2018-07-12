# frozen_string_literal: true

require 'support/pages/user_page'

class DashboardPage < UserPage
  def click_my_request
    click_on 'My Requests'
  end

  def click_my_calls
    click_on 'My Calls'
  end

  def click_inbox
    click_on 'Inbox'
  end
end
