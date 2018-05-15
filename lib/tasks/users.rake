namespace :users do
  desc "TODO"
  task create_test_users: :environment do
    user = User.create!(
      email: 'johnsnow@got.com',
      password: '123456',
      first_name: 'Jon',
      last_name: 'Snow'
    ).confirm
    Profile.first.update(
      rate: 15,
      expercoin_rate: 15 * 1.07,
      title: 'King in the North',
      about: "Jon Snow, born Aegon Targaryen, is the son of Lyanna Stark and Rhaegar Targaryen, the late Prince of Dragonstone. From infancy, Jon is presented as the bastard son of Lord Eddard Stark, Lyanna's brother, and raised by Eddard alongside his lawful children at Winterfell but his true parentage is kept secret from everyone, including Jon himself. In order to escape his bastard status, Jon joins the Night's Watch and is eventually chosen as Lord Commander. However, he is later murdered in a mutiny and resurrected by the Red Priestess Melisandre. Freed from his Night's Watch vows, Jon joins his cousin, Sansa Stark, in building an army and together they retake Winterfell from House Bolton, restoring House Stark's dominion over the North with Jon being declared the new King in the North. However, after successfully capturing a wight and presenting it to the Lannisters as proof that the Army of the Dead is real, Jon pledges himself and his army to Daenerys Targaryen, Rhaegar's sister, and steps down as King of the North.",
      address: 'Winterfell',
      country: 'Sothoryos',
      state: 'North',
      remote_photo_url: 'https://ksassets.timeincuk.net/wp/uploads/sites/55/2016/06/250116GOTJonSnow_SYK_250116-1-920x610.jpg',
      years_of_experience: 5,
      specialization: { 'item_1': 'Death', 'item_2': 'Dragons', 'item_3': 'Ice' }
    )

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
      rate = Faker::Number.between(5, 200)
      user.profile.update(
        rate: rate,
        expercoin_rate: rate * 1.07,
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
