# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RegistrationsController, type: :request do
  let(:user_params) do
    {
      first_name: 'First Name',
      last_name: 'Last Name',
      email: 'test@email.com',
      password: '123456789',
      password_confirmation: '123456789'
    }
  end

  describe 'POST create' do
    let(:user) { User.first }
    before { post user_registration_path, params: { user: user_params } }
    it_behaves_like 'created model',
                    model: User,
                    params: {
                      confirmed_at: nil,
                      email: 'test@email.com'
                    }
  end
end
