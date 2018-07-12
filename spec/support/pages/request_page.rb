class RequestPage
  include Capybara::DSL

  def initialize(url = nil, user = nil)
    @url = url
    LoginPage.new(user).fill_and_submit_form if user.present?
  end

  def fill_new_request
    fill_in 'request[cell_number]', with: '1234567'
    find('input#request_first_date').click
    (find 'td.day', text: Time.new.next_day.day.to_s).click
    find('input#request_second_date').click
    (find 'td.day', text: Time.new.next_day(3).day.to_s).click
    find('input#request_third_date').click
    (find 'td.day', text: Time.new.next_day(5).day.to_s).click
    click_on 'Continue'
    sleep 0.1
  end

  def confirm_new_request
    click_on 'Submit Request'
    sleep 0.1
    click_on 'View Request'
    sleep 0.1
  end
end
