class LoginModalPage
  include Capybara::DSL

  def initialize(url, user)
    @url = url
    @user = user
  end

  def fill_and_submit_form
    visit @url
    find('a.nav-link', text: 'Login').click
    fill_in 'Email Address', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Login'
  end
end
