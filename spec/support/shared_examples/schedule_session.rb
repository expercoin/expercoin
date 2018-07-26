shared_examples 'schedule session continue after error' do |args|
  scenario "successfully continue when #{args[:missing_field]} filled" do
    expect(page.body).to include args[:message]
    request_page.fill_missing_fields args[:missing_field] => request_params[args[:missing_field]]
    request_page.confirm_new_request
    expect(page.body).to include expert.first_name, expert.last_name, request_params[args[:missing_field]]
  end
end
