# frozen_string_literal: true

class RequestDecorator < BaseDecorator
  def session_date
    return created_at.strftime('%b %d, %Y at %l:%M %P') unless selected_date
    selected_date.strftime('%b %d, %Y at %l:%M %P')
  end
end
