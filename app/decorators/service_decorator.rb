# frozen_string_literal: true

class ServiceDecorator < BaseDecorator
  include ActionView::Helpers::NumberHelper

  def profile_photo
    featured_profile.photo.thumb.url
  end

  def profile_full_name
    ProfileDecorator.new(featured_profile).full_name
  end

  def owner_profile
    owner.profile
  end 

  def display_rate
    return unless owner_profile.expercoin_rate.present?
    Eth::UsdConverter.new(owner_profile.expercoin_rate/100.0)
                     .eth_value
                     .yield_self { |v| v.to_f }
  end 

  def display_rate_in_usd
    return unless owner_profile.expercoin_rate.present?
    owner_profile.expercoin_rate / 100.0
  end

  private

  def featured_profile
    service_providers.find_by(featured: true).try(:profile) || service_providers.first.profile
  end
end
