# frozen_string_literal: true

require 'support/pages/admin/user_page'
module Admin
  class ServicePage < UserPage
    def add_new_meta_tags(meta_tags)
      click_on 'Add New Page'
      fill_and_submit_form 'service[page_attributes]', meta_tags, 'Update Service'
      open
    end
  end
end
