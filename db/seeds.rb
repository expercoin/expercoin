# frozen_string_literal: true
Rake::Task['categories:create_blockchain'].invoke
if Rails.env.development? 
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
  Rake::Task['categories:create_test_business'].invoke
  Rake::Task['categories:create_test_sales'].invoke
  Rake::Task['categories:create_test_funding'].invoke
  Rake::Task['users:create_test_users'].invoke
  Rake::Task['requests:create_test_requests'].invoke
  Rake::Task['requests:update_requests_to_accepted'].invoke
  Rake::Task['requests:update_requests_to_completed'].invoke
  Rake::Task['reviews:create_test_reviews'].invoke
  Rake::Task['wallets:create_test_wallets'].invoke
  Rake::Task['messages:create_test_messages'].invoke
  Rake::Task['messages:create_test_parent_messages'].invoke
  Rake::Task['payments:create_test_payments'].invoke
end
