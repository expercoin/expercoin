# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ConfirmationsController, type: :request do
  let(:user) { create(:user, :unconfirmed) }

  describe '.after_confirmation_path_for' do
    before { get user_confirmation_path(confirmation_token: user.confirmation_token) }
    it { expect(response).to redirect_to dashboard_index_path }
    it { expect(controller.current_user).to eq user }
  end
end
