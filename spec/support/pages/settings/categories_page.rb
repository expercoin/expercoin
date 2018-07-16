# frozen_string_literal: true

require 'support/pages/user_page'
module Settings
  class CategoriesPage < UserPage
    def select_categories(categories)
      categories.each { |category| find('#profile_form_category_ids').select category }
    end
  end
end
