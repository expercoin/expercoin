# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Inbox', type: :system do
  include_examples 'create user, profile'
  let(:sender) { create(:user, first_name: 'Joe', last_name: 'Doe') }
  let!(:message) { create(:message, receiver: user, sender: sender) }

  subject(:inbox_page) { InboxPage.new(inbox_index_path, user) }

  feature 'List senders' do
    before { inbox_page.open }
    it { expect(page.body).to include 'Joe Doe' }
  end

  feature 'Open Message' do
    before { inbox_page.click_details }
    it { expect(page.body).to include message.body, message.title }
  end
end
