# frozen_string_literal: true

# Transaction Class for Decorators pattern
class TransactionDecorator < BaseDecorator
  def display_amount
    eth_amount
  end
end
