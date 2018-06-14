# frozen_string_literal: true

class RequestDecorator < BaseDecorator
  def session_date
    return created_at.strftime('%b %d, %Y at %l:%M %P') unless selected_date
    selected_date.in_time_zone(time_zone).strftime('%b %d, %Y at %l:%M %P') << ", #{time_zone}"
  end

  def amount
    rate = expert.expercoin_rate
    (rate * requested_length.to_i).to_f
  end

  def usd_amount
    ( Eth::UsdConverter.new(amount).usd_value ).round(2)
  end
end
