# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    user do
      User.first || create(:user, email: 'sender@message.com')
    end

    resource do
      Request.first || create(:request)
    end
  end
end
