class RegistrationPage
  include Capybara::DSL

  def initialize(url, params)
    @url = url
    @params = params
  end

  def fill_and_submit_form
    visit @url
    fill_in 'First Name', with: first_name
    fill_in 'Last Name', with: last_name
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password Confirmation', with: password
    click_on 'Sign up'
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
