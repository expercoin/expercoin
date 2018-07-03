# frozen_string_literal: true

FactoryBot.define do
  factory :service do
    title Faker::Commerce.product_name
    remote_cover_image_url Faker::Avatar.image
    category
    content do
      title = "<h1>#{Faker::Movie.quote}</h1>"
      body = []
      rand(5..10).times do
        body << "<p>#{Faker::Lorem.paragraph}</p>"
      end
      title + body.join
    end
    profiles { create_list(:profile, 1) }
    service_providers do
      build_list(
        :service_provider, 1,
        service: @instance,
        profile: profiles.first,
        featured: true
      )
    end

    trait :with_owner do
      owner { profiles.first.user }
    end
  end
end
