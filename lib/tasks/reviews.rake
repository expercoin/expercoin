namespace :reviews do
  desc "TODO"
  task create_test_reviews: :environment do
    requests = Request.all.sample(50)
    requests.each do |request|
      review = Review.create!(
        profile: request.expert,
        author: request.requester,
        request: request,
        rate: Faker::Number.between(1, 5),
        message: Faker::MostInterestingManInTheWorld.quote
      )
      puts "Review created, Profile: #{review.profile.id}, Author: #{review.author.id}, Request: #{review.request.id}, Rate: #{review.rate}, Message: #{review.message}"
    end
  end

end
