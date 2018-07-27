# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SubcategoriesController, type: :request do
  let(:category) { create(:category) }
  let(:subcategories) { create_list(:category, 3, parent: category) }

  describe 'GET show' do
    before { get category_subcategory_path(category, subcategories.sample) }
    it_behaves_like 'loaded page'
  end
end
