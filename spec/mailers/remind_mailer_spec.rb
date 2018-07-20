require "rails_helper"

RSpec.describe RemindMailer, type: :mailer do
  let(:request) { create(:request) }
  let(:expert) { request.expert }
  let(:requester) { request.requester }

  describe '.call_remind_expert' do
    let(:mail) { described_class.call_remind_expert(request) }
    it { expect(mail.subject).to eq  "You have scheduled call session at #{request.selected_date}" }
    it { expect(mail.to).to eq [expert.user.email] }
  end

  describe '.call_remind_requester' do
    let(:mail) { described_class.call_remind_requester(request) }
    it { expect(mail.subject).to eq  "You have scheduled call session at #{request.selected_date}" }
    it { expect(mail.to).to eq [requester.user.email] }
  end
end
