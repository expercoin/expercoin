FactoryBot.define do
  factory :service_provider do
    service
    profile
    featured false

    trait :featured do
      featured true
    end
  end
end
