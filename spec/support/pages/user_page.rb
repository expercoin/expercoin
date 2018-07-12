# frozen_string_literal: true

class UserPage
  include Capybara::DSL

  def initialize(url = nil, user = nil)
    @url = url
    @user = user
    LoginPage.new(user).fill_and_submit_form if user.present?
  end

  def open
    visit @url
  end

  def click_schedule_session
    visit @url
    click_on 'Schedule Session'
    sleep 0.1
  end

  private

  attr_reader :url, :user
end
