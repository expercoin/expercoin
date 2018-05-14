namespace :users do
  desc "TODO"
  task create_test_users: :environment do
    User.create!(
      email: 'johnsnow@got.com',
      password: '123456',
      first_name: 'John',
      last_name: 'Snow'
    ).confirm

    30.times do
      user = User.create!(
        first_name: Faker::Name.first_name,
        last_name: Faker::Name.last_name,
        email: Faker::Internet.email,
        password: '123456'
      )
      user.confirm
      women = ['a', 'e'].include? user.first_name.last
      photo = "https://randomuser.me/api/portraits/#{'wo' if women}men/#{rand(1..99)}.jpg"
      specialization = {}
      rand(5..15).times do |i|
        specialization["item_#{i}"] = Faker::Commerce.department
      end
      user.profile.update(
        rate: Faker::Number.between(10, 1000),
        title: Faker::Job.title,
        about: Faker::Lorem.paragraph(2, true, 10),
        address: Faker::Address.street_address,
        state: Faker::Address.state,
        country: 'United States',
        city: Faker::Address.city,
        zip_code: Faker::Address.zip_code,
        remote_photo_url: photo,
        specialization: specialization

      )
      categories_ids = []
      10.times { categories_ids << rand(2..15) }
      categories_ids.uniq!
      categories = Category.where(id: categories_ids)
      user.profile.categories << categories
    end
  end

end
