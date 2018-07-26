shared_examples 'create user, profile' do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
end

shared_examples 'create user, profile, categories' do
  let!(:categories) do
    3.times { create(:category, :with_parent, name: Faker::ProgrammingLanguage.name) }
    Category.children.map(&:name)
  end
  include_examples 'create user, profile'
end

shared_examples 'create user, profile, service' do
  let!(:service) { create(:service, owner: profile) }
  include_examples 'create user, profile'
end

shared_examples 'initialize service params' do
  let(:service_params) do
    {
      title: 'Test service title',
      expercoin_rate: '10',
      content: 'Test Service Content',
      category: categories.second,
      tags: ['First Tag', 'Second Tag', 'Third Tag']
    }
  end
end


shared_examples 'initialize request params' do
  let(:request_params) do
    {
      title: 'Some test request title',
      message: 'Some test request message'
    }
  end

end

shared_examples 'eth address params' do
  let(:eth_address) { '0x222334909e528d7ae5994225736942ca38ac87b0' }
  let(:eth_address_params) do
    {
      public_key: eth_address
    }
  end
end

shared_examples 'settings params' do
  let(:settings_params) do
    {
      first_name: 'Tom',
      last_name: 'Jerry',
      title: 'Hounter',
      expercoin_rate: 10.5,
      address: 'Home City',
    }
  end
end

shared_examples 'about params' do
  let(:settings_params) do
    {
      about: 'Some info about me'
    }
  end
end

shared_examples 'location params' do
  let(:location_params) do
    {
      country: 'United Kingdom',
      state: 'England',
      city: 'London',
    }
  end
end

shared_examples 'user params' do
  let(:user_params) do
    {
      first_name: 'Joe',
      last_name: 'Doe',
      email: 'some-test@email.com',
      password: '123456',
      password_confirmation: '123456'
    }
  end
end
