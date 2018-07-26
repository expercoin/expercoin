# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Settings::VideoController, type: :request do
  let(:user) { create(:user) }
  let(:profile) { user.profile }
  let!(:logged_user) { sign_in(user) }
  let(:video_params) do
    {
      video_url: 'https://www.youtube.com/watch?v=D2YTrX7X6rY'
    }
  end

  describe '.index' do
    before { get settings_video_index_path }
    it_behaves_like 'authenticated user'
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST create' do
    before do
      post settings_video_index_path,
             params: { profile_form: video_params },
             xhr: true
      profile.reload
    end
    it_behaves_like 'authenticated user'
    it { expect(profile.video_url).to eq video_params[:video_url] }
  end
end
