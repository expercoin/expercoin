namespace :categories do
  desc "TODO"
  task create_blockchain: :environment do
    blockchain = Category.create!(name: 'Blockchain', description: '')
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
      Category.create!(name: category, description: '', parent_id: blockchain.id)
    end
  end

end
