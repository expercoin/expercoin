# frozen_string_literal: true

require 'support/pages/user_page'
class HomePage < UserPage
  def find_an_expert
    click_on 'Find an Expert'
  end

  def share_expertise
    click_on 'Share your Expertise'
  end
end
