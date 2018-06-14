# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::ChildTransaction do
  let(:transaction) { create(:transaction) }
  let(:request) { transaction.request }
  let(:expert) { request.expert }
  let(:expert_user) { expert.user }
  let(:child_transaction) { Eth::ChildTransaction.new(transaction) }

  describe '.initialize' do
    it { expect { child_transaction }.not_to raise_error }
  end

  describe '.create_transactions' do
    before { child_transaction.create_transactions }
    it { expect(Transaction.where(receiver: expert_user)).not_to be_empty }
    it { expect(Transaction.completed).not_to be_empty }
  end
end
