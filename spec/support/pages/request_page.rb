# frozen_string_literal: true

require 'support/pages/user_page'
class RequestPage < UserPage
  def fill_new_request
    fill_in 'request[cell_number]', with: '1234567'
    find('input#request_first_date').click
    all('td.day', text: Time.new.next_day.day.to_s).last.click
    find('input#request_second_date').click
    all('td.day', text: Time.new.next_day(3).day.to_s).last.click
    find('input#request_third_date').click
    all('td.day', text: Time.new.next_day(5).day.to_s).last.click
    click_on 'Continue'
    sleep 0.1
  end

  def fill_new_request_with(params)
    fill_in 'request[title]', with: params[:title]
    fill_in 'request[message]', with: params[:message]
    fill_new_request
  end

  def fill_missing_fields(params)
    params.keys.each do |key|
      fill_in "request[#{key}]", with: params[key]
    end
    click_on 'Continue'
    sleep 0.1
  end

  def confirm_new_request
    click_on 'Submit Request'
    sleep 0.1
    click_on 'View Request'
    sleep 0.1
  end

  def join_room
    visit url
    click_on 'Join Call'
    sleep 0.1
  end

  def create_room
    visit url
    click_on 'Request Call'
    sleep 0.1
  end

  def schedule_session_from_profile(params)
    fill_new_request_with params
    confirm_new_request
  end

  def schedule_session_from_service
    fill_new_request
    confirm_new_request
  end
end
