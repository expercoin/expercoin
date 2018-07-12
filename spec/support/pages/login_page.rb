class LoginPage
  include Capybara::DSL

  def initialize(url, user)
    @url = url
    @user = user
  end

  def fill_and_submit_form
    visit @url
    fill_in 'Email', with: @user.email
    fill_in 'Password', with: @user.password
    click_on 'Login'
  end
end
