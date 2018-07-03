FactoryBot.define do
  factory :service do
    title "MyString"
    remote_cover_image_url Faker::Avatar.image
    cover_video "MyString"
    content "MyText"
    group nil
  end
end
