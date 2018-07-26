# frozen_string_literal: true

require 'rails_helper'

RSpec.feature 'Settings Categories', type: :system do
  include_examples 'create user, profile, categories'

  subject(:settings_categories_page) { Settings::CategoriesPage.new(settings_categories_path, user) }

  feature 'Add Categories' do
    before do
      settings_categories_page.open
      settings_categories_page.select_categories(categories)
      settings_categories_page.submit_form
    end

    it { expect(page).to have_select('profile_form_category_ids', selected: categories) }
  end
end
