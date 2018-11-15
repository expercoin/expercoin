# frozen_string_literal: true

require 'rails_helper'

RSpec.describe TransactionValidator do
  let(:request) { create(:request, requested_amount_eth: 0.00836774199713779) }
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
      let(:request) { create(:request, requested_amount_eth: 0.00000000000000001) }
      it { expect(transaction_validator.valid?).to be false }
    end
  end

  describe '.errors' do
    let(:error_messages) { transaction_validator.errors.full_messages.to_s.downcase }

    context 'when wrong amount' do
      let(:request) { create(:request, requested_amount_eth: 0.00000000000000001) }
      before { transaction_validator.valid? }
      it { expect(error_messages).to include('contract must be valid') }
    end

    context 'when wrong address' do
      let(:transaction) { create(:transaction, to_eth: '0x0123412341234', request: request) }
      before do
        allow(transaction_validator).to receive(:eth_contract_address_formated) do
          '0xcbde01a6de9e0bb6f4053df9423008b2f5b08d11'
        end
        transaction_validator.valid?
      end
      it { expect(error_messages).not_to be_empty }
    end
  end
end
