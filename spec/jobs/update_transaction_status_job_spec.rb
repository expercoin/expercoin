# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateTransactionStatusJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later(key) }

  let(:key) { 123 }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .with(key)
      .on_queue('default')
  end
end
