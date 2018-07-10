FactoryBot.define do
  factory :asset do
    name 'expercoin_logo.png'
    file { File.open("#{Rails.root}/public/images/expercoin_logo.png") }
    resource { create(:message) }
  end
end
