class LoginModalPage
  include Capybara::DSL

  def initialize(url, user)
    @url = url
    @user = user
  end

  def fill_and_submit_form
    visit @url
    sleep 0.4
    find('a.nav-link', text: 'Login').click
    sleep 0.4
    fill_in 'Email Address', with: @user.email
    sleep 0.4
    fill_in 'Password', with: @user.password
    sleep 0.4
    click_on 'Login'
    sleep 0.2
  end
end
