# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NotificationsController, type: :request do
  let(:notification) { create(:notification, :request) }
  let(:user) { notification.user }
  let!(:logged_user) { sign_in(user) }

  describe 'GET show' do
    before do
      get notification_path(notification)
      notification.reload
    end
    it_behaves_like 'authenticated user'
    it { expect(response).to redirect_to call_path(notification.resource) }
    it { expect(notification.status).to eq 'read' }
  end
end
