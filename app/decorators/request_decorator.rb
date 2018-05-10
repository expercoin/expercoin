# frozen_string_literal: true

class RequestDecorator < BaseDecorator
  def session_date
    created_at.strftime('%b %d, %Y at %l:%M %P')
  end
end
