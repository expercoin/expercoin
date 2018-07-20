require "rails_helper"

RSpec.describe AdminMailer, type: :mailer do
  let(:service) { create(:service, :pending) }

  describe '.new_offer' do
    let(:mail) { described_class.new_offer(service) }
    it { expect(mail.subject).to eq 'New Offer submitted' }
    it { expect(mail.to).to eq ['mentor@expercoin.com'] }
  end
end
