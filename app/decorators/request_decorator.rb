# frozen_string_literal: true

class RequestDecorator < BaseDecorator
  def session_date
    return created_at.strftime('%b %d, %Y at %l:%M %P') unless selected_date
    selected_date.in_time_zone(time_zone).strftime('%b %d, %Y at %l:%M %P') << ", #{time_zone}"
  end

  def amount
    exp_rate = service&.expercoin_rate || expert.expercoin_rate
    estimated_cost(exp_rate/100).yield_self {
      |it| Eth::UsdConverter.new(it).eth_value
    }
  end

  def usd_amount
    Eth::UsdConverter.new(amount).usd_value&.round(2)
  end

  def call_approved?
    (inprogress? || verified?) && call_ready?
  end
  
  def estimated_cost(rate)
    RequestCalculator.new(self).calculate_cost(rate)
  end

  def call_ready?
    selected_date_bigger_than_current_time && selected_date_not_bigger_than_two_hours
    true
  end

  def selected_date_bigger_than_current_time
    selected_date.in_time_zone(time_zone) >= Time.now.in_time_zone(time_zone) - 15.minutes
  end

  def selected_date_not_bigger_than_two_hours
    selected_date.in_time_zone(time_zone) < Time.now.in_time_zone(time_zone) + 2.hours
  end
end
