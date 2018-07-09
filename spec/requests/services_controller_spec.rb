# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ServicesController, type: :request do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
  let!(:logged_user) { sign_in(user) }
  let(:service) { create(:service, owner: profile) }
  let(:category) { create(:category) }
  let(:service_params) do
    {
      title: 'Some test service',
      content: 'Some content in service',
      cover_image: File.open("#{Rails.root}/public/images/expercoin_logo.png"),
      category_id: category.id,
      expercoin_rate: 100,
      rate: 93
    }
  end

  describe 'GET new' do
    before { get new_service_path }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'GET edit' do
    before { get edit_service_path(service) }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'GET index' do
    before { get services_path }
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'GET show' do
    before { get service_path(service) }
    it { expect(response).to have_http_status(:ok) }
  end

  describe 'POST create' do
    before { post services_path, params: { service_form: service_params } }
    it_behaves_like 'authenticated user'
    it { expect(Service.count).to eq 1 }
    it { expect(response).to redirect_to service_path(Service.first) }
  end

  describe 'PATCH update' do
    before { patch service_path(service), params: { service_form: service_params } }
    it_behaves_like 'authenticated user'
    it { expect(Service.first.title).to eq service_params[:title] }
    it { expect(response).to redirect_to service_path(service) }
  end 

  describe 'DELETE destroy' do
    before { delete service_path(service) }
    it_behaves_like 'authenticated user'
    it { expect(Service.count).to eq 0 }
    it { expect(response).to redirect_to settings_services_path }
  end
end
