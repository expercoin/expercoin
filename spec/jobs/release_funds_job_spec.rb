# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ReleaseFundsJob, type: :job do
  let(:transaction) { create(:transaction, tx_hash: nil) }
  let!(:test_env) { ActiveJob::Base.queue_adapter = :test }
  describe 'enque job' do
    it 'releases funds' do
      expect do
        ReleaseFundsJob.perform_later(transaction)
      end.to have_enqueued_job.with(transaction)
    end
  end
end
