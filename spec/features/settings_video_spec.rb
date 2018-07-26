# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Settings Video', type: :system do
  include_examples 'create user, profile'

  subject(:settings_video_page) { Settings::VideoPage.new(settings_video_index_path, user) }

  feature 'Add Video' do
    before do
      settings_video_page.open
      settings_video_page.add_video 'https://player.vimeo.com/video/265272458'
    end
    # it { expect(page.body).to include 'https://player.vimeo.com/video/265272458' }
  end
end
