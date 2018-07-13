# frozen_string_literal: true

require 'support/pages/user_page'
class SettingsPage < UserPage
  def select_location(scope, params)
    params.keys.each do |key|
      page.select params[key], from: "#{scope}[#{key}]"
    end
    click_on 'Save'
  end
end
