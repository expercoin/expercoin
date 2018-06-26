# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PagesController, type: :request do
  let(:categories) { create_list(:category, 10, :with_parent) }

  describe 'GET business_home' do
    before { get root_path }
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'GET mentors_home' do
    before { get for_mentors_path }
    it { expect(response).to have_http_status(:ok) }
  end
end
