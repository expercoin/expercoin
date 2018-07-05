# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CategoriesController, type: :request do
  let!(:category) { create(:category) }

  describe 'GET show' do
    before { get category_path(category) }
    it { expect(response).to have_http_status(:ok) }
  end
end
