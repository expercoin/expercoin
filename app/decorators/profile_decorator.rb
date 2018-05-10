# frozen_string_literal: true

# Profile Class for Decorators pattern
class ProfileDecorator < BaseDecorator

  def full_name
    "#{first_name} #{last_name}"
  end

  def display_location_with_abbreviation
    "#{country} | #{state}"
  end

  def exc_price
    return '' unless rate.present?
    "<strong>EXC #{rate}</strong>/min"
  end
end
