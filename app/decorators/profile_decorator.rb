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
    "<strong>#{ENV['CURRENCY']} #{expercoin_rate}</strong>/min"
  end

  def average_rating
    ProfileRating.new(self).average_rating
  end

  def display_rate
    FloatFormater.new(expercoin_rate.to_f).with_dots
  end

  def unread_messages
    user.messages.unread.count
  end

  def unread_messages?
    user.messages.unread.present?
  end

  Request.statuses.keys.each do |status|
    define_method "#{status}_calls_count" do
      requests.send(status).count
    end

    define_method "#{status}_requests_count" do
      created_requests.send(status).count
    end
  end
end
