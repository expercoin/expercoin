# frozen_string_literal: true

RSpec.shared_examples 'authenticated user' do
  let(:current_user) { controller.current_user }
  it 'should authenticate user' do
    expect(controller.authenticate_user!).not_to be_nil
  end
  it { expect(current_user.email).to eq user.email }
  it { expect(response).not_to redirect_to user_session_path }
end

RSpec.shared_examples 'authenticated user get ok' do
  include_examples 'authenticated user'
  it { expect(response).to have_http_status(:ok) }
end
