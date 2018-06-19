# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  let!(:category) { create(:category) }

  describe '.index' do
    before { get categories_path }
    it { expect(response).to have_http_status(:ok) }
  end

  describe '.show' do
    before { get category_path(category) }
    it { expect(response).to have_http_status(:ok) }
  end
end
