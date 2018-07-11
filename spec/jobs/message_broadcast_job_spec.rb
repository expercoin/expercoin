# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageBroadcastJob, type: :job do
  include ActiveJob::TestHelper
  let(:message) { create(:message) }

  subject(:job) { described_class.perform_later(message.id) }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .on_queue('default')
  end

  describe '.perform' do
    before do
      described_class.perform_now(message.id)
      perform_enqueued_jobs { job }
    end
  end
end
