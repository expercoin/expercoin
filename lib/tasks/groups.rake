namespace :groups do
  desc 'Create groups'
  task create: :environment do

    # create programing and tech
    parent = Group.create!(
      title: 'Programming & Tech',
      subtitle: 'Get all the technical bells and whistles without paying for a programming degree',
      remote_icon_static_url: 'http://icons.iconarchive.com/icons/paomedia/small-n-flat/1024/device-laptop-icon.png'
    )
    puts "Created parent group with title #{parent.title}"

    subgroups = [
      'WordPress',
      'Web Programming',
      'Ecommerce',
      'Mobile Apps & Web',
      'Website Builders & CMS',
      'Desktop applications',
      'Data Analysis & Reports',
      'Convert Files',
      'Support & IT',
      'Chatbots',
      'Databases',
      'User Testing',
      'QA'
    ]

    subgroups.each do |subgroup|
      Group.create!(
        parent: parent,
        title: subgroup,
        cover: File.open("#{Rails.root}/public/images/fake/#{rand(1..8)}.jpg")
      )
      puts "Created subgroup with title #{subgroup}"
    end

    # create Business
    parent = Group.create!(
      title: 'Business',
      subtitle: 'Your business = your passion. Outsource smaller tasks so you can focus on growth',
      remote_icon_static_url: 'http://www.iconhot.com/icon/png/smashing-pumpkins/500/halloween-letter.png'
    )
    puts "Created parent group with title #{parent.title}"

    subgroups = [
      'Virtual Assistant',
      'Market Research',
      'Business Plans',
      'Branding Services',
      'Legal Consulting',
      'Financial Consulting',
      'Business Tips',
      'Presentations',
      'Career Advice',
      'Flyer Distribution'
    ]

    subgroups.each do |subgroup|
      Group.create!(
        parent: parent,
        title: subgroup,
        cover: File.open("#{Rails.root}/public/images/fake/#{rand(1..8)}.jpg")
      )
      puts "Created subgroup with title #{subgroup}"
    end
  end

end
