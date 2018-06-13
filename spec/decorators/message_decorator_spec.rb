# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessageDecorator do
  let(:profile) { create(:profile, :with_photo) }
  let(:message) { create(:message, :unread, sender: profile.user) }
  let(:message_decorator) { MessageDecorator.new(message) }

  describe '.full_name' do
  end

  describe '.status' do
    context 'when unread' do
      it { expect(message_decorator.status).to eq 'unread' }
    end

    context 'when read' do
      before do
        message.update(unread: false)
        message.reload
      end
      it { expect(message_decorator.status).to eq 'read' }
    end
  end

  describe '.format_date' do
    it 'shows correct format' do
      datetime_formated = message.created_at.strftime('%b %d, %Y at %l:%M %P')
      expect(message_decorator.format_date).to eq datetime_formated
    end
  end

  describe '.sender_photo_thumb' do
    it 'shows senders photo thumb' do
      photo = profile.photo.thumb.url
      expect(message_decorator.sender_photo_thumb).to eq photo
    end
  end

  describe '.receiver_name' do
    it 'should include receiver first name in output' do
      first_name = message.receiver.profile.first_name
      expect(message_decorator.receiver_name).to include(first_name)
    end
  end
end
