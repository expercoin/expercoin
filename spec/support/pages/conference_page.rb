# frozen_string_literal: true

require 'support/pages/user_page'
class ConferencePage < UserPage
  def send_message(message)
    find('#message-body').set(message)
    find('#message-body').native.send_keys(:return)
    sleep 0.1
  end
end
