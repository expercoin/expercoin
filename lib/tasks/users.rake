namespace :users do
  desc "TODO"
  task create_test_users: :environment do
    30.times do
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: Faker::Internet.password,
      )
      user.confirm
      user.profile.update(
        rate: Faker::Number.between(10, 1000),
        title: Faker::Job.title,
        about: Faker::Lorem.paragraph,
        address: Faker::Address.street_address,
        state: Faker::Address.state,
        country: 'United States'

      )
      categories_ids = []
      10.times { categories_ids << rand(2..15) }
      categories_ids.uniq!
      categories = Category.where(id: categories_ids)
      user.profile.categories << categories
    end
  end

end
