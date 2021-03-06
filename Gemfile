# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.0'

gem 'activeadmin'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'autoprefixer-rails'
gem 'aws-ses', require: 'aws/ses'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap', '~> 4.1.1'
gem 'carrierwave', '~> 1.0'
gem 'carrierwave-video'
gem 'city-state'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dotenv-rails', require: 'dotenv/rails-now'
gem 'eth'
gem 'ethereum.rb'
gem 'faker'
gem 'font-awesome-rails'
gem 'friendly_id', '~> 5.1.0'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'kaminari'
gem 'mini_magick'
gem 'omniauth-linkedin-oauth2'
gem 'pg_search'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.0.rc1'
gem 'redis', '~> 4.0'
gem 'sass-rails', '~> 5.0'
gem 'tinymce-rails'
gem 'turbolinks', '~> 5'
gem 'twilio-ruby', '~> 5.6.1'
gem 'uglifier', '>= 1.3.0'
gem 'virtus'
gem 'webmock'
gem 'carrierwave-base64'
gem 'icalendar'
gem 'meta-tags'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'mini_racer', platforms: :ruby

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_bot_rails'
  gem 'rspec-rails', '~> 3.7'
  gem 'simplecov', require: false
  gem 'sqlite3'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '~> 2.15'
  gem 'chromedriver-helper'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers', '~> 3.1'
end

group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'webpacker', '~> 3.4'
