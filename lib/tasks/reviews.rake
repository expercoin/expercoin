namespace :reviews do
  desc "TODO"
  task create_test_reviews: :environment do
    profiles = Profile.all
    profiles.each do |author_profile|
      profile = Profile.find_by(id: rand(1..30))
      next if author_profile == profile
      Review.create!(
        profile: profile,
        author: author_profile,
        rate: Faker::Number.between(1, 5),
        message: Faker::Lorem.sentence(3)
      )
    end
  end

end
