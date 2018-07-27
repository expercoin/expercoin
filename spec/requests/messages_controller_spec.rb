# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MessagesController, type: :request do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let(:receiver) { create(:user) }
  let!(:logged_user) { sign_in(user) }
  let(:message_params) do
    {
      title: 'Some test message',
      body: 'Test message body',
      receiver_id: receiver.id
    }
  end

  describe 'POST create' do
    before { post messages_path, params: { message: message_params, format: 'js' } }
    it_behaves_like 'authenticated user'
    it_behaves_like 'created model',
                    model: Message,
                    params: {
                      title: 'Some test message',
                      body: 'Test message body'
                    },
                    authenticated_user: true
  end
end
