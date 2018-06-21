# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateTransactionStatusJob, type: :job do
  let!(:transaction) { create(:transaction) }
  let!(:test_env) { ActiveJob::Base.queue_adapter = :test }
  describe 'enque job' do
    it 'updates transactions' do
      expect do
        UpdateTransactionStatusJob.perform_later
      end.to have_enqueued_job
    end
  end
end
