# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    title Faker::Commerce.product_name
    remote_cover_image_url Faker::Avatar.image
    category { create(:category, :with_parent) }
    expercoin_rate { rand(100.1000) }
    rate { expercoin_rate * 0.93 }
    content do
      title = "<h1>#{Faker::Movie.quote}</h1>"
      body = []
      2.times do
        body << "<p>#{Faker::Lorem.paragraph}</p>"
      end
      title + body.join
    end
    owner { create(:user) }
  end
end
