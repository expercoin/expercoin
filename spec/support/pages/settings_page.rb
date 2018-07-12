# frozen_string_literal: true

require 'support/pages/user_page'
class SettingsPage < UserPage
  def fill_and_submit_form(scope, params)
    visit url
    params.keys.each do |key|
      fill_in "#{scope}[#{key}]", with: params[key]
    end
    click_on 'Save'
  end
end
