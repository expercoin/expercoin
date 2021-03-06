# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::CreateTransaction do
  let(:tx_hash) { '0xcce351e43a4c3ed8b9e4e96652992d1a9c1f928497eb0ba470997ccc6a56f917' }
  let(:amount) { 0.0025 }
  let(:create_transaction) { Eth::CreateTransaction.new(amount, tx_hash) }

  describe '.initialize' do
    # it { expect { create_transaction }.not_to raise_error }
  end

  describe '.perform' do
  end
end
