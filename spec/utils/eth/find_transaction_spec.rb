# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Eth::FindTransaction do
  let(:tx_hash) { '0xcce351e43a4c3ed8b9e4e96652992d1a9c1f928497eb0ba470997ccc6a56f917' }
  let(:find_transaction) { Eth::FindTransaction.new(tx_hash) }

  describe '.initialize' do
    it { expect { find_transaction }.not_to raise_error }
  end

  describe '.perform' do
    it { expect(find_transaction.perform).to be_present }
  end
end
