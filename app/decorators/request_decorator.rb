# frozen_string_literal: true

class RequestDecorator < BaseDecorator
  def session_date
    return created_at.strftime('%b %d, %Y at %l:%M %P') unless selected_date
    selected_date.in_time_zone(time_zone).strftime('%b %d, %Y at %l:%M %P') << ", #{time_zone}"
  end

  def amount
    exp_rate = service&.expercoin_rate || expert.expercoin_rate
    estimated_cost(exp_rate/100.0).yield_self {
      |it| Eth::UsdConverter.new(it).eth_value
    }
  end

  def usd_amount
    Eth::UsdConverter.new(amount).usd_value&.round(2)
  end

  def call_approved?
    (inprogress? || verified?)
  end
  
  def estimated_cost(rate)
    RequestCalculator.new(self).calculate_cost(rate)
  end

  def call_ready?
    DatetimeValidator.new(
      Time.now,
      {
        start_date: selected_date,
        end_date: selected_date + requested_length_in_minutes
      }
    ).in_range
  end

  # def selected_date_bigger_than_current_time
  #   selected_date.in_time_zone(time_zone) >= Time.now.in_time_zone(time_zone) - 15.minutes
  # end

  # def selected_date_not_bigger_than_two_hours
  #   selected_date.in_time_zone(time_zone) < Time.now.in_time_zone(time_zone) + 2.hours
  # end

  def funds_message
    return 'Funds Withdrawn For This Call' if withdrawn?
    return 'Expert and Site Funded' if expert_received_funds? && site_received_funds?
    return 'Expert Funded' if expert_received_funds?
    return 'Site Funded' if site_received_funds?
  end

  def withdrawn?
    client_transaction&.completed?
  end

  def expert_received_funds?
    !withdrawn? && expert_transaction&.completed?
  end

  def site_received_funds?
    !withdrawn? && site_transaction&.completed?
  end

  def expert_transaction
    eth_transaction.transactions.find_by(
      request_id: id,
      receiver_id: expert.user_id
    )
  rescue NoMethodError
    nil
  end

  def site_transaction
    eth_transaction.transactions.find_by(
      request_id: id,
      receiver_id: nil
    )
  rescue NoMethodError
    nil
  end

  def client_transaction
    eth_transaction.transactions.find_by(
      request_id: id,
      receiver_id: requester.user_id
    )
  rescue NoMethodError
    nil
  end

  def client_review_transaction
    reviews.find_by(author_id: requester.user_id)
  end

  def expert_review_transaction
    reviews.find_by(author_id: expert.user_id)
  end

  def expert_address
    default_expert_eth_address&.public_key
  end

  def default_expert_eth_address
    expert_eth_addresses.find_by(default: true) || expert_eth_addresses.last
  end

  def expert_eth_addresses
    expert.wallet.eth_addresses
  end
end
