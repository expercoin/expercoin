namespace :services do
  desc "Create services"
  task create: :environment do
    subgroups = Group.where.not(parent: nil)
    subgroups.each do |subgroup|
      providers = Profile.all.sample(3)
      5.times do
        service = Service.create!(
          title: "I will #{['teach', 'help', 'show'].sample} you #{subgroup.title}",
          group: subgroup,
          content: Faker::Lorem.paragraph(30, true, 100),
          cover_image: File.open("#{Rails.root}/public/images/fake/#{rand(1..8)}.jpg")
        )
        service.profiles << providers
        service.service_providers.sample.update(featured: true)
        puts "Created service with title #{service.title}"
      end
    end
  end

end
