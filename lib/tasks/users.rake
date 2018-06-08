namespace :users do
  desc "TODO"
  task create_test_users: :environment do
    user = User.create!(
      email: 'johnsnow@got.com',
      password: '123456',
      first_name: 'Jon',
      last_name: 'Snow'
    )
    user.confirm
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

    user = User.create!(
      email: 'sedad@miavision.net',
      password: '123456',
      first_name: 'Sedad',
      last_name: 'Kosovac'
    )
    user.confirm
    user.profile.update(
      rate: 15,
      expercoin_rate: 15 * 1.07,
      title: 'Blockchain developer',
      about: "Sedad is currently aiding in developing out Expercoin's Republics ecosystem. He works with Ethereum Solidity, Kubernetes and Docker to build out Blockchain systems that will be used by Expercoin's enterprise clients. As part of his role, he has gained expertise in the following technologies and concepts: public and private blockchains; IaaS, PaaS, and SaaS offerings; containerization; container orchestration using Kubernetes; and decentralized design.",
      address: 'Doboj-istok',
      country: 'Bosnia and Herzegovina',
      state: 'Tuzla',
      remote_photo_url: 'https://www.expercoin.com/uploads/profile/photo/15/sedad.jpeg',
      years_of_experience: 5,
      specialization: { 'item_1': 'Rails', 'item_2': 'Ember', 'item_3': 'Solidity' }
    )

    user = User.create!(
      email: 'almin@miavision.net',
      password: '123456',
      first_name: 'Almin',
      last_name: 'Karic'
    )
    user.confirm
    user.profile.update(
      rate: 15,
      expercoin_rate: 15 * 1.07,
      title: 'Blockchain developer',
      about: " Almin writes smart contracts using Solidity programming language for Expercoin Republic's DApps. Furthermore, he has implemented IPFS in Expercoin ecosystem for decentralized storage.  He works with a range of technologies that intersect with blockchain and decentralization.  He has also written smart contracts using Solidity.  On the front-end he works with  Ember.js and JQuery.  ",
      address: 'Zivinice',
      country: 'Bosnia and Herzegovina',
      state: 'Tuzla',
      remote_photo_url: 'https://www.expercoin.com//uploads/profile/photo/17/Almin.jpeg',
      years_of_experience: 5,
      specialization: { 'item_1': 'Rails', 'item_2': 'Ember', 'item_3': 'Solidity' }
    )

    12.times do
      first_name = Faker::Name.first_name
      last_name = Faker::Name.last_name
      email = "#{first_name}-#{last_name}@expercoin.com"
      user = User.create(
        first_name: first_name,
        last_name: last_name,
        email: email,
        password: '123456'
      )
      user.confirm
      women = ['a', 'e'].include? first_name.last
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
        about: Faker::Lorem.paragraph(2, true, 50),
        address: Faker::Address.street_address,
        state: Faker::Address.state,
        country: 'United States',
        city: Faker::Address.city,
        zip_code: Faker::Address.zip_code,
        remote_photo_url: photo,
        specialization: specialization

      )
      categories = Category.where.not(parent: nil).sample(rand(2..15))
      user.profile.categories << categories
      puts "User #{user.profile.first_name} #{user.profile.last_name} created"
    end
  end

end
