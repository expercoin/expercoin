# frozen_string_literal: true

shared_examples 'created model' do |args|
  it { expect(args[:model].count).not_to be 0 }
  if args[:params]
    let(:params) { args[:params].with_indifferent_access }
    let(:model) { args[:model].last }
    it { expect(model.attributes >= params).to eq true }
  end
  it { expect(flash[args[:flash][:type]]).to include args[:flash][:message] } if args[:flash]
  include_examples 'authenticated user' if args[:authenticated_user]
end

shared_examples 'updated model' do |args|
  let(:model) { args[:model].order(updated_at: :desc).first }
  let(:params) { args[:params].with_indifferent_access }
  it { expect(model.attributes >= params).to be true }
  include_examples 'authenticated user' if args[:authenticated_user]
end

shared_examples 'deleted model' do |args|
  let(:model) { args[:model] }
  it { expect(model.count).to eq 0 }
  include_examples 'authenticated user' if args[:authenticated_user]
end

shared_examples 'loaded page' do |args|
  args ||= {}
  it do
    sign_out user if args[:sign_out]
    expect(response).to have_http_status(:ok)
  end
  include_examples 'authenticated user' if args[:authenticated_user]
end
