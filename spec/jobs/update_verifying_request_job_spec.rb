# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UpdateVerifyingRequestJob, type: :job do
  include ActiveJob::TestHelper

  subject(:job) { described_class.perform_later }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .on_queue('default')
  end
end
