# frozen_string_literal: true

FactoryBot.define do
  factory :notification do
    user do
      User.first || create(:user, email: 'sender@message.com')
    end

    trait :request do
      resource { Request.first || create(:request) }
      title I18n.t("notification.request.new.title")
      content I18n.t("notification.request.new.content")
    end

    trait :message do
      resource { Message.first || create(:message) }
      title I18n.t("notification.message.new.title")
      content I18n.t("notification.message.new.content")
    end
  end
end
