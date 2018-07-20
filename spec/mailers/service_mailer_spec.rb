require "rails_helper"

RSpec.describe ServiceMailer, type: :mailer do
  let(:service) { create(:service) }
  let(:owner) { service.owner }

  describe '.published' do
    let(:mail) { described_class.published(service) }
    it { expect(mail.subject).to eq 'Your offer has been published' }
    it { expect(mail.to).to eq [owner.user.email] }
  end
end
