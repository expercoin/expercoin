# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::StatusTransaction do
  let(:tx_hash_success) { '0x8b305a999064d73d751348af9ee89aa18f49eb58a350b59a6c0a691533becef5' }
  let(:tx_hash_fail) { '0x9642f3652dbdb01956611e67811183c635c7e2cb9311822240f5bfafc5a36135' }

  let(:fail_transaction) { described_class.new(tx_hash_fail) }
  let(:success_transaction) { described_class.new(tx_hash_success) }

  describe '.initialize' do
    it { expect { fail_transaction }.not_to raise_error }
  end

  describe '.success?' do
    it { expect(success_transaction.success?).to be(true) }
  end

  describe '.fail?' do
    it { expect(success_transaction.fail?).to be(false) }
  end

  describe '.success?' do
    it { expect(fail_transaction.success?).to be(false) }
  end

  describe '.fail?' do
    it { expect(fail_transaction.fail?).to be(true) }
  end
end
