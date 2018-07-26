shared_examples 'create user, profile, categories' do
  let!(:categories) do
    3.times { create(:category, :with_parent, name: Faker::ProgrammingLanguage.name) }
    Category.children.map(&:name)
  end
  include_examples 'create user, profile'
end

shared_examples 'create user, profile' do
  let(:profile) { create(:profile) }
  let(:user) { profile.user }
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
