# frozen_string_literal: true

class ServiceDecorator < BaseDecorator
  include ActionView::Helpers::NumberHelper

  def profile_photo
    owner.photo.thumb.url
  end

  def profile_full_name
    ProfileDecorator.new(owner).full_name
  end

  def owner_profile
    owner
  end 

  def display_rate
    return unless expercoin_rate.present?
    Eth::UsdConverter.new(expercoin_rate/100.0)
                     .eth_value
                     .yield_self { |v| v.to_f }
  end

  def display_rate_in_usd
    return unless expercoin_rate.present?
    expercoin_rate / 100.0
  end
end
