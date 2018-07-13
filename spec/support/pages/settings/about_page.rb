# frozen_string_literal: true

require 'support/pages/user_page'
module Settings
  class AboutPage < UserPage
    def fill_about(text)
      fill_in('profile_form_about', visible: false, with: text)
    end

    def add_specializations(*items)
      items.each_with_index do |item, index|
        fill_in("profile_form_specialization_item_#{index + 1}", with: item)
      end
    end

    def click_on_add(num = 1)
      num.times do
        click_on 'Add'
        sleep 0.1
      end
    end
  end
end
