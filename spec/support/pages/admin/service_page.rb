# frozen_string_literal: true

require 'support/pages/user_page'
module Admin
  class ServicePage < UserPage
  def initialize(url = nil, user = nil)
    @url = url
    @user = user
    LoginPage.new(user).fill_and_submit_form if user.present?
  end

    def add_new_meta_tags(meta_tags)
      click_on 'Add New Page'
      fill_and_submit_form 'service[page_attributes]', meta_tags, 'Update Service'
      open
    end
  end
end
