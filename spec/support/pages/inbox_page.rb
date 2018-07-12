class InboxPage
  include Capybara::DSL

  def initialize(url, user)
    @url = url
    @user = user
    LoginPage.new(user).fill_and_submit_form
  end

  def open
    visit @url
  end
end
