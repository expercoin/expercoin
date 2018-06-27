namespace :services do
  desc "Create services"
  task create: :environment do
    subcategories = Category.children
    subcategories.each do |subcategory|
      providers = Profile.all.sample(3)
      featured_provider = providers.sample
      rand(1..5).times do
        title = "<h1>#{Faker::Movie.quote}</h1>"
        body = []
        rand(5..10).times do
          body << "<p>#{Faker::Lorem.paragraph}</p>"
        end
        content = title + body.join
        service = Service.create!(
          title: Faker::Commerce.product_name,
          category: subcategory,
          content: content,
          cover_image: File.open("#{Rails.root}/public/images/fake/#{rand(1..8)}.jpg"),
          profiles: providers
        )
        service.service_providers.find_by(profile: featured_provider).update(featured: true)
        service.update(owner: featured_provider.user)
        puts "Created service with title #{service.title}"
      end
    end
  end

end
