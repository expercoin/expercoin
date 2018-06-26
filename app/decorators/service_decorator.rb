# frozen_string_literal: true

class ServiceDecorator < BaseDecorator
  def starting_price
    "#{ENV['CURRENCY']} #{FloatFormater.new(featured_profile.expercoin_rate).with_dots}"
  end

  def rating
    ProfileRating.new(featured_profile).average_rating
  end

  def profile_photo
    featured_profile.photo.thumb.url
  end

  def profile_full_name
    ProfileDecorator.new(featured_profile).full_name
  end

  private

  def featured_profile
    service_providers.find_by(featured: true).try(:profile)
  end
end
