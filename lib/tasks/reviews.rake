namespace :reviews do
  desc "TODO"
  task create_test_reviews: :environment do
    requests = Request.last(50)
    requests.each do |request|
      Review.create!(
        profile: request.expert,
        author: request.requester,
        request: request,
        rate: Faker::Number.between(1, 5),
        message: Faker::Lorem.sentence(3)
      )
    end
  end

end
