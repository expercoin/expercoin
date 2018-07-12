class RegistrationPage
  include Capybara::DSL

  def initialize(url, params)
    @url = url
    @params = params
  end

  def fill_and_submit_form
    visit @url
    sleep 0.4
    fill_in 'First Name', with: first_name
    sleep 0.4
    fill_in 'Last Name', with: last_name
    sleep 0.4
    fill_in 'Email', with: email
    sleep 0.4
    fill_in 'Password', with: password
    sleep 0.4
    fill_in 'Password Confirmation', with: password
    sleep 0.4
    click_on 'Sign up'
    sleep 0.2
  end

  private

  def email
    @params[:email]
  end

  def first_name
    @params[:first_name]
  end

  def last_name
    @params[:last_name]
  end

  def password
    @params[:password]
  end
end
