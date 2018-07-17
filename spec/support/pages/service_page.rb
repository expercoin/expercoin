# frozen_string_literal: true

require 'support/pages/user_page'
class ServicePage < UserPage
  def select_category(category)
    select 'service_form', { category_id: category }
  end

  def fill_content(text)
    tinymce_fill_in 'service_form_content', with: text
  end

  def select_tags(*tags)
    binding.pry
  end
end
