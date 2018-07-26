# frozen_string_literal: true

require 'rails_helper'

RSpec.describe GetStartedController, type: :request do
  let(:user) { create(:user) }
  let!(:logged_user) { sign_in(user) }

  describe 'GET index' do
    before { get get_started_index_path }
    it_behaves_like 'authenticated user get ok'
  end
end
