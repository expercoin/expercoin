# frozen_string_literal: true

require 'rails_helper'

RSpec.describe InboxController, type: :request do
  let(:message) { create(:message) }
  let(:user) { message.receiver }
  let!(:logged_user) { sign_in(user) }

  describe 'GET show' do
    before { get inbox_path(message) }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'GET index' do
    before { get inbox_index_path }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'GET all' do
    before { get all_inbox_index_path }
    it_behaves_like 'authenticated user get ok'
  end
end
