# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Requests::TimesController, type: :request do
  let(:requester) { create(:profile) }
  let(:user) { requester.user }
  let!(:logged_user) { sign_in(user) }
  let(:req) { create(:request, :pending, requester: requester) }
  let(:third_date) { Faker::Time.forward(3, :evening).to_date }
  let(:third_time) { Faker::Time.forward(3, :evening).to_time.strftime('%I:%M %p') }
  let(:selected_date) { req.sugested_times.third.formated_datetime }
  let(:request_params) do
    {
      third_date: third_date,
      third_time: third_time
    }
  end

  describe 'GET edit' do
    before { get edit_requests_time_path(req) }
    it_behaves_like 'authenticated user get ok'
  end

  describe 'PATCH update third time' do
    before do
      patch requests_time_path(req), params: { request: request_params }
      req.reload
    end

    it_behaves_like 'authenticated user'

    context 'datetime' do
      it { expect(req.third_date).to eq third_date }
      it { expect(req.third_time).to eq third_time }
    end
  end
end
