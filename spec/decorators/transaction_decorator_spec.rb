# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionDecorator do
  let(:transaction) { create(:transaction, eth_amount: Eth::ValueFormatter.new(0.5).to_hex) }
  let(:transaction_decorator) { TransactionDecorator.new(transaction) }

  describe '.display_amount' do
    it { expect(transaction_decorator.display_amount).to eq 0.5 }
  end
end
