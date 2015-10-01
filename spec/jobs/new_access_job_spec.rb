require 'rails_helper'

RSpec.describe NewAccessJob, type: :job do
  include ActiveJob::TestHelper

  fixtures :links

  let(:google_link) { links(:google_link) }
  let(:params) { {ip: '127.0.0.1', link_id: google_link.id} }

  subject(:job) { described_class.perform_later(params) }

  it 'queues the job' do
    expect { job }
      .to change(ActiveJob::Base.queue_adapter.enqueued_jobs, :size).by(1)
  end

  it 'is in access queue' do
    expect(NewAccessJob.new.queue_name).to eq('access')
  end

  it 'executes perform' do
    expect(Access).to receive(:create).with(params)
    perform_enqueued_jobs { job }
  end

  after do
    clear_enqueued_jobs
    clear_performed_jobs
  end
end