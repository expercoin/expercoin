class LoginModalPage
  include Capybara::DSL

  def initialize(url, data)
    @url = url
    @data = data
  end

  def fill_and_submit_form
    visit @url
    sleep 0.4
    find('a.nav-link', text: 'Login').click
    sleep 0.4
    fill_in 'Email Address', with: @data.email
    sleep 0.4
    fill_in 'Password', with: @data.password
    sleep 0.4
    click_on 'Login'
    sleep 0.2
  end
end
