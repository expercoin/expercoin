# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionValidator do
  let(:request) { create(:request, requested_amount_eth: 0.015) }
  let(:transaction) { create(:transaction, request: request) }
  let(:transaction_validator) { TransactionValidator.new(transaction) }

  describe '.initialize' do
    it { expect { transaction_validator }.not_to raise_error }
  end

  describe '.valid?' do
    context 'when valid' do
      it { expect(transaction_validator.valid?).to be true }
    end

    context 'when wrong amount' do
      let(:transaction) { create(:transaction, eth_amount: 0.00000000001, request: request) }
      it { expect(transaction_validator.valid?).to be false }
    end
  end

  describe '.errors' do
    let(:error_messages) { transaction_validator.errors.full_messages.to_s.downcase }

    context 'when wrong amount' do
      let(:transaction) { create(:transaction, eth_amount: 0.00000000001, request: request) }
      before { transaction_validator.valid? }
      it { expect(error_messages).to include('amount must be valid') }
    end

    context 'when wrong address' do
      let(:transaction) { create(:transaction, to_eth: '0x0123412341234', request: request) }
      before { transaction_validator.valid? }
      it { expect(error_messages).to include('address is not included') }
    end
  end
end
