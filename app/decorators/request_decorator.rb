# frozen_string_literal: true

class RequestDecorator < BaseDecorator
  def session_date
    return created_at.strftime('%b %d, %Y at %l:%M %P') unless selected_date
    selected_date.in_time_zone(time_zone).strftime('%b %d, %Y at %l:%M %P') << ", #{time_zone}"
  end

  def amount
    rate = Eth::ValueFormatter.new(expert.expercoin_rate).from_hex
    (rate * requested_length.to_i).round(7)
  end

  def usd_amount
    ( Eth::UsdConverter.new(amount).usd_value ).round(2)
  end
end
