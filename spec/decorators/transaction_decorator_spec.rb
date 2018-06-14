# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionDecorator do
  let(:transaction) { create(:transaction, eth_amount: 0.0000123456) }
  let(:transaction_decorator) { TransactionDecorator.new(transaction) }

  describe '.display_amount' do
    it { expect(transaction_decorator.display_amount).to eq 0.0000123456 }
  end
end
