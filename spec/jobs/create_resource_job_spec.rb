# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CreateResourceJob, type: :job do
  include ActiveJob::TestHelper
  let(:request) { create(:request) }
  let(:params) { { resource_id: request.id, resource_type: 'Request' } }

  subject(:job) { described_class.perform_later('Notifications::Create', params) }

  it 'queues the job' do
    expect { job }.to have_enqueued_job(described_class)
      .on_queue('default')
  end

  describe '.perform' do
    before do
      described_class.perform_now('Notifications::Create', param)
      perform_enqueued_jobs { job }
    end
  end
end
