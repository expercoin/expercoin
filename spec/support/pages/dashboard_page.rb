class DashboardPage
  include Capybara::DSL

  def initialize(url, user)
    @url = url
    @user = user
    LoginPage.new(user).fill_and_submit_form
  end

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
