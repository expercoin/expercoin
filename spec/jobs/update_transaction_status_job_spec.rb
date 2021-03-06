# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateTransactionStatusJob, type: :job do
  let(:tx_hash) { '0xcce351e43a4c3ed8b9e4e96652992d1a9c1f928497eb0ba470997ccc6a56f917' }
  let(:transaction) { create(:transaction, tx_hash: tx_hash, eth_amount: 0.0025) }
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later(transaction) }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .on_queue('default')
  end

  describe '.perform' do
    before do
      described_class.perform_now(transaction)
      perform_enqueued_jobs { job }
    end
    it { expect(transaction.status).to eq 'completed' }
  end
end
