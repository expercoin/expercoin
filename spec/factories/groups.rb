FactoryBot.define do
  factory :group do
    title Faker::ProgrammingLanguage.name
    remote_icon_static_url Faker::Avatar.image
    remote_icon_active_url Faker::Avatar.image
    summary Faker::Lorem.paragraph
    cover { File.open("#{Rails.root}/public/images/fake/#{rand(1..8)}.jpg") }

    trait :with_parent do
      parent { create(:group) }
    end
  end
end
