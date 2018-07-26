# frozen_string_literal: true

require 'support/pages/user_page'
module Settings
  class VideoPage < UserPage
    def add_video(video_link)
      sleep 0.1
      find('#video_uploader').set(video_link)
      sleep 0.1
      click_on 'Save'
    end
  end
end
