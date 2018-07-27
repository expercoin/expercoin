# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PaymentsController, type: :request do
  let(:transaction) { create(:transaction) }
  let(:user) { create(:user) }
  let!(:logged_user) { sign_in(user) }

  describe 'GET index' do
    before { get payments_path }
    it_behaves_like 'loaded page', authenticated_user: true
  end

  describe 'GET show' do
    before { get payment_path(transaction) }
    it_behaves_like 'loaded page', authenticated_user: true
  end
end
