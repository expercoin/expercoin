# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationBroadcastJob, type: :job do
  include ActiveJob::TestHelper
  let(:notification) { create(:notification) }

  subject(:job) { described_class.perform_later(notification.id) }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .on_queue('default')
  end

  describe '.perform' do
    before do
      described_class.perform_now(notification.id)
      perform_enqueued_jobs { job }
    end
  end
end
