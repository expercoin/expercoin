class ProfilePage
  include Capybara::DSL

  def initialize(url, user = nil)
    @url = url
    LoginPage.new(user).fill_and_submit_form if user.present?
  end

  def click_schedule_session
    visit @url
    click_on 'Schedule Session'
    sleep 0.1
  end
end
