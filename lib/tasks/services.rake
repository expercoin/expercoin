namespace :services do
  desc "Create services"
  task create: :environment do
    subcategories = Category.children
    subcategories.each do |subcategory|
      rand(1..5).times do
        title = "<h3>#{Faker::Movie.quote}</h3>"
        body = []
        rand(5..10).times do
          body << "<p>#{Faker::Lorem.paragraph}</p>"
        end
        rate = rand(100..800)
        content = title + body.join
        service = Service.create!(
          title: Faker::Commerce.product_name,
          category: subcategory,
          content: content,
          rate: rate,
          expercoin_rate: rate * 1.07,
          cover_image: File.open("#{Rails.root}/public/images/fake/#{rand(1..8)}.jpg"),
          owner: Profile.all.sample,
          featured: [true, false].sample,
          status: rand(0..2),
          tag_list: Faker::Commerce.department(4, true).gsub(' & ', ', ')
        )
        puts "Created service with title #{service.title}"
      end
    end
  end

end
