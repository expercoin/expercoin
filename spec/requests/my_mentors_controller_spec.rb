# frozen_string_literal: true

require 'rails_helper'

RSpec.describe MyMentorsController, type: :request do
  let(:profile) { create(:profile) }
  let(:user) { create(:user) }
  let!(:logged_user) { sign_in(user) }
  let(:requests) { create_list(:request, 3, requester: profile) }

  describe 'GET index' do
    before { get my_mentors_path }
    it_behaves_like 'loaded page', authenticated_user: true
  end
end
