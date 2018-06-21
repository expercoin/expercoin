# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReleaseFundsJob, type: :job do
  let(:amount) { 0.0025 }
  let(:transaction) { create(:transaction, tx_hash: nil, eth_amount: amount) }
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later(transaction) }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .with(transaction)
      .on_queue('default')
  end

  describe '.perform' do
    before do
      described_class.perform_now(transaction)
      perform_enqueued_jobs { job }
    end
    it { expect(transaction.tx_hash).not_to be_nil }
  end
end
