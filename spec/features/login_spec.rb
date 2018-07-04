# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Login', type: :system do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }

  it 'Log in successfully' do
  end
end
