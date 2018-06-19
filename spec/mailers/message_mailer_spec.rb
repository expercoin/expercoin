# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageMailer, type: :mailer do
  let(:sender) { create(:profile).user }
  let(:receiver) { create(:profile).user }
  let(:message) { create(:message, sender: sender, receiver: receiver) }

  describe '.new_message' do
    let(:mail) { MessageMailer.new_message(message) }
    it { expect(mail.subject).to eq 'New message on Expercoin' }
    it { expect(mail.to).to eq [receiver.email] }
  end

  describe '.reply_message' do
    let(:reply_message) do
      create(
        :message,
        parent: message,
        sender: receiver,
        receiver: sender
      )
    end
    let(:mail) { MessageMailer.reply_message(reply_message) }
    it { expect(mail.subject).to eq 'New message on Expercoin' }
    it { expect(mail.to).to eq [sender.email] }
  end
end
