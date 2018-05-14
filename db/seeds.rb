# frozen_string_literal: true
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
Rake::Task['categories:create_blockchain'].invoke
Rake::Task['users:create_test_users'].invoke if Rails.env.development?
Rake::Task['requests:create_test_requests'].invoke if Rails.env.development?
Rake::Task['reviews:create_test_reviews'].invoke if Rails.env.development?
Rake::Task['wallets:create_test_wallets'].invoke if Rails.env.development?

