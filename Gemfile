# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.6.3"

# rails default gems
gem "rails", "~> 6.0.0.rc1" # Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem "pg", ">= 0.18", "< 2.0" # Use postgresql as the database for Active Record
gem "puma", "~> 3.11" # Use Puma as the app server
gem "sass-rails", "~> 5" # Use SCSS for stylesheets
gem "webpacker", "~> 4.0" # Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem "turbolinks", "~> 5" # Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem "jbuilder", "~> 2.5" # Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'redis', '~> 4.0' # Use Redis adapter to run Action Cable in production
# gem 'bcrypt', '~> 3.1.7' # Use Active Model has_secure_password
# gem 'image_processing', '~> 1.2' # Use Active Storage variant
gem "bootsnap", ">= 1.4.2", require: false # Reduces boot times through caching; required in config/boot.rb

# other gems for all environments
gem "administrate"
gem "counter_culture", "~> 2.0"
gem "friendly_id", "~> 5.2.4"
gem "kaminari"
gem "rack-attack-rate-limit", require: "rack/attack/rate-limit"
gem "rack-attack"
gem "rack-cors"
gem "react-rails"
gem "slim-rails"
gem "strip_attributes"

group :development, :test do
  gem "awesome_print"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "pry-byebug"
  gem "pry-rails"
  gem "rubocop", "0.71.0", require: false
  gem "rubocop-rails"
  gem "vcr" # https://github.com/titusfortner/webdrivers/wiki/Using-with-VCR-or-WebMock
  gem "webmock"
end

group :development do
  gem "annotate"
  gem "web-console", ">= 3.3.0" # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring" # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rails-erd"
end

group :test do
  gem "capybara", ">= 2.15" # Adds support for Capybara system testing and selenium driver
  gem "selenium-webdriver"
  gem "webdrivers" # Easy installation and use of web drivers to run system tests with browsers
end
