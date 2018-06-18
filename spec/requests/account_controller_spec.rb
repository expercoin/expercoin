# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AccountController, type: :request do
  let!(:user) { sign_in(create(:user)) }

  describe '.index' do
    before { get account_index_path }
    it { expect(controller.authenticate_user!).to be_present }
    it { expect(response).to have_http_status(:ok) }
  end
end
