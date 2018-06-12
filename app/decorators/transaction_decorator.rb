# frozen_string_literal: true

# Transaction Class for Decorators pattern
class TransactionDecorator < BaseDecorator
  def display_amount
    Eth::ValueFormatter.new(eth_amount).from_hex.to_f
  end
end
