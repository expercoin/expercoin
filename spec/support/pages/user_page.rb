# frozen_string_literal: true

class UserPage
  include Capybara::DSL

  def initialize(url = nil, user = nil)
    @url = url
    @user = user
    LoginPage.new(user).fill_and_submit_form if user.present?
  end

  def open
    visit url
  end

  def submit_form(submit = 'Save')
    click_on submit
  end

  def click_schedule_session
    visit @url
    click_on 'Schedule Session'
    sleep 0.1
  end

  def fill_and_submit_form(scope, params, submit = 'Save')
    params.keys.each do |key|
      fill_in "#{scope}[#{key}]", with: params[key]
    end
    click_on submit
  end

  private

  attr_reader :url, :user
end
