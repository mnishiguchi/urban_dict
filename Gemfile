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
gem "active_link_to"
gem "counter_culture", "~> 2.0"
gem "hashdiff", [">= 1.0.0.beta1", "< 2.0.0"] # https://github.com/liufengyun/hashdiff/issues/45#issuecomment-499566400
gem "kaminari"
gem "rack-attack-rate-limit", require: "rack/attack/rate-limit"
gem "rack-attack"
gem "rack-cors"
gem "react-rails"
gem "simple_form"
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
  gem "foreman"
  gem "guard-minitest"
  gem "guard" # NOTE: this is necessary in newer versions
  gem "listen", ">= 3.0.5", "< 3.2"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "spring" # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "web-console", ">= 3.3.0" # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
end

group :test do
  gem "capybara", ">= 2.15" # Adds support for Capybara system testing and selenium driver
  gem "minitest-reporters"
  gem "rails-controller-testing"
  gem "ruby-prof" # https://github.com/guard/guard-minitest#rails-gem-dependencies
  gem "selenium-webdriver"
  gem "shoulda", "~> 3.5"
  gem "shoulda-matchers", "~> 2.0"
  gem "webdrivers" # Easy installation and use of web drivers to run system tests with browsers
end
