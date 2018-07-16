# frozen_string_literal: true

require 'support/pages/user_page'
module Settings
  class CategoriesPage < UserPage
    def select_categories(categories)
      sleep 0.1
      categories.each { |category| find('#profile_form_category_ids').select category }
    end
  end
end
