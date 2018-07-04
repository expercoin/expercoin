# frozen_string_literal: true

class ServiceDecorator < BaseDecorator
  include ActionView::Helpers::NumberHelper

  def starting_price
    "#{ENV['CURRENCY']} #{FloatFormater.new(lowest_profile_rating).with_dots}"
  end

  def starting_price_in_usd
    number_to_currency(Eth::UsdConverter.new(lowest_profile_rating).usd_value.round(2)) + ' per minute'
  rescue StandardError
  end

  def starting_price_full
    "#{ENV['CURRENCY']} #{lowest_profile_rating}"
  end

  def rating
    ServiceRating.new(self).average_rating
  end

  def profile_photo
    featured_profile.photo.thumb.url
  end

  def profile_full_name
    ProfileDecorator.new(featured_profile).full_name
  end

  private

  def featured_profile
    service_providers.find_by(featured: true).try(:profile) || service_providers.first.profile
  end

  def lowest_profile_rating
    profiles.map(&:expercoin_rate).compact.sort.first
  end
end
