# frozen_string_literal: true
Rake::Task['categories:create_categories'].invoke
if Rails.env.development? 
  AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end
  Rake::Task['users:create_test_users'].invoke
  Rake::Task['requests:create_test_requests'].invoke
  Rake::Task['requests:update_requests_to_accepted'].invoke
  Rake::Task['requests:update_requests_to_completed'].invoke
  Rake::Task['reviews:create_test_reviews'].invoke
  Rake::Task['wallets:create_test_wallets'].invoke
  Rake::Task['messages:create_test_messages'].invoke
  Rake::Task['messages:create_test_parent_messages'].invoke
  Rake::Task['payments:create_test_payments'].invoke
  Rake::Task['payments:create_test_payments_with_parent'].invoke
  Rake::Task['groups:create'].invoke
  Rake::Task['services:create'].invoke
