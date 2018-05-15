# frozen_string_literal: true

# Profile Class for Decorators pattern
class ProfileDecorator < BaseDecorator

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_location_with_abbreviation
    "#{country} | #{state}"
  end

  def last_session
    requests.completed&.last&.created_at&.strftime('%b, %-d %Y')
  end

  def exc_price
    return '' unless rate.present?
    "<strong>EXPR #{expercoin_rate}</strong>/min"
  end
end
