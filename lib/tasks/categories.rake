namespace :categories do
  desc "Create blockchain categories"
  task create_blockchain: :environment do
    blockchain = Category.create!(
      name: 'Blockchain',
      description: '',
      remote_banner_url: 'https://experfy.s3.amazonaws.com/uploads/course/banner/149/a0c5a3ad7c.jpg'
    )
    puts "Created Category #{blockchain.name}"
    sub_categories = [
      'Alt-coins',
      'Bitcoin Protocol',
      'Distributed Ledgers',
      'Governance',
      'ICO Advisory Services',
      'ICO Community Manager',
      'ICO Legal Advice',
      'ICO Marketing',
      'ICO Whitepaper',
      'Identity Management',
      'Meta-coins',
      'Mining',
      'Networking',
      'Para-chains',
      'Payments',
      'Prototype Development',
      'Security',
      'Smart Contract Audit',
      'Smart Contract Development'
    ]

    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: blockchain.id
      )
      puts "Created Category #{category}, parent: #{blockchain.name}"
    end
  end


  desc "Create categories"
  task create_categories: :environment do
    parent = Category.create!(
      name: 'Banking and Compliance',
      description: '',
    )
    puts "Created Category #{parent.name}"
    sub_categories = [
      'Crypto Banking Advice',
      'KYC and AML Regulations',
      'Crypto Payments'
    ]

    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end

    parent = Category.create!(
      name: 'ICO Services',
      description: '',
    )
    puts "Created Category #{parent.name}"
    sub_categories = [
      'ICO Roadshows',
      'ICO Exchange Listing Strategy',
      'ICO Advisor',
      'ICO Social Media Strategy',
      'ICO Legal Strategy',
      'ICO Marketing Strategy',
      'ICO Whitepaper',
      'Institutional Investor Matchmaking',
      'ICO Directory Listing',
      'Airdrop Design',
      'Bounty Management',
      'Community Management'
    ]

    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end

    parent = Category.create!(
      name: 'Cryptoeconomics',
      description: '',
    )
    puts "Created Category #{parent.name}"
    sub_categories = [
      'Token Economics',
      'Utility Token Design',
      'Security Token Design',
      'Game Theory and Network Design'
    ]

    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end

    parent = Category.create!(
      name: 'Crypto Trading',
      description: '',
    )
    puts "Created Category #{parent.name}"
    sub_categories = [
      'Crypto Exchange Trading Setup',
      'Crypto Wallet Setup',
      'Crypto Arbitrage Strategy',
      'Crypto Trading Strategy',
      'Crypto OTC Brokerage'
    ]

    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end

    parent = Category.create!(
      name: 'Smart Contracts',
      description: '',
    )
    puts "Created Category #{parent.name}"
    sub_categories = [
      'Smart Contract Development',
      'Smart Contract Audit'
    ]

    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end

    parent = Category.create!(
      name: 'Blockchain Consulting',
      description: '',
    )
    puts "Created Category #{parent.name}"
    sub_categories = [
      'Hyperledger Fabric',
      'Ethereum',
      'Waves',
      'VeChain',
      'R3 Corda',
      'Ripple',
      'Quorum',
      'SAP Leonardo',
      'Azure Blockchain',
      'Oracle Blockchain',
      'Mastercard Blockchain',
      'AWS Blockchain'
    ]

    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end

    parent = Category.create!(
      name: 'Services by Jurisdiction',
      description: '',
    )
    puts "Created Category #{parent.name}"
    sub_categories = [
      'Belarus',
      'British Virgin Islands',
      'Cayman Islands',
      'Gibraltar',
      'Isle of Man',
      'Maldives',
      'Singapore',
      'United States',
      'United Kingdom',
      'Japan',
      'Panama',
      'Puerto Rico'
    ]

    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end

    parent = Category.create!(
      name: 'Token Development',
      description: '',
    )
    puts "Created Category #{parent.name}"
    sub_categories = [
      'ERC721 Token Development',
      'ST-20 Token Development',
      'ERC20 Token Development',
      'ERC223 Token Development'
    ]

    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end
  end

  desc "Create test business categories"
  task create_test_business: :environment do
    parent = Category.create!(
      name: 'Business',
      description: 'Get advice on all aspects of business from international strategy to leading a team of innovators.',
      remote_banner_url: 'https://s3.amazonaws.com/clarityfm-production/attachments/27/default/9609072453_3cee9e2779_b.jpg?1389279799'
    )
    sub_categories = [
      'Career Advice',
      'Branding',
      'Financial Consulting',
      'Customer Engagement',
      'Strategy',
      'Sectors',
      'Getting Started',
      'Human Resources',
      'Business Development',
      'Legal'
    ]
    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end
  end

  desc "Create test sales categories"
  task create_test_sales: :environment do
    parent = Category.create!(
      name: 'Sales & Marketing',
      description: 'Get your message heard and have people love to buy from you.',
      remote_banner_url: 'https://s3.amazonaws.com/clarityfm-production/attachments/30/default/440698504_0c8e1a15aa_b.jpg?1389107154'
    )
    sub_categories = [
      'Social Media Marketing',
      'Search Engine Optimization',
      'Public Relations',
      'Branding',
      'Publishing',
      'Inbound Marketing',
      'Email Marketing',
      'Copywriting',
      'Growth Strategy',
      'Search Engine Marketing',
      'Sales & Lead Generation',
      'Advertising'
    ]
    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end
  end

  desc "Create test funding categories"
  task create_test_funding: :environment do
    parent = Category.create!(
      name: 'Funding',
      description: "Make the money. Don't make the money make you.",
      remote_banner_url: 'https://s3.amazonaws.com/clarityfm-production/attachments/32/default/6732835997_2721f16b2f_b.jpg?1389107985'
    )
    sub_categories = [
      'Crowdfunding',
      'Kickstarter',
      'Venture Capital',
      'Finance',
      'Bootstrapping',
      'Nonprofit'
    ]
    sub_categories.each do |category|
      Category.create!(
        name: category,
        description: '',
        parent_id: parent.id
      )
      puts "Created Category #{category}, parent: #{parent.name}"
    end
  end

end
