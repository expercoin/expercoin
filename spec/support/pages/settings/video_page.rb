# frozen_string_literal: true

require 'support/pages/user_page'
module Settings
  class VideoPage < UserPage
    def add_video(video_link)
      find('#video_uploader').set(video_link)
    end
  end
end
