# frozen_string_literal: true

require 'support/pages/user_page'
module Settings
  class ServicePage < UserPage
    def open_new_service_page
      click_on 'Create a new offering'
      sleep 0.1
    end

    def edit_service
      find('.fa-pencil').click
      sleep 0.1
    end

    def delete_service
      find('.fa-trash-o').click
      find('button', text: 'Delete').click
    end
  end
end
