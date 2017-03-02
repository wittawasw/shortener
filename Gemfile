source 'https://rubygems.org'
ruby '2.4.0'

gem 'rails', '~> 5.0.1'
gem 'sqlite3', platform: [:ruby, :mswin, :mingw]
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'active_model_serializers', '~> 0.10.0.rc2'
gem 'bootswatch-sass', '~> 3.3.0'

gem 'angularjs-rails'
gem 'nprogress-rails'

gem 'kaminari'
gem 'devise'

# Queueing
gem 'sidekiq'
gem 'redis-namespace'
#gem 'sinatra' # sidekiq web dependency

group :production do
  gem 'puma'
end

group :development do
  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'web-console', '~> 2.0'
  gem 'rubocop'
end

group :development, :test do
  gem 'pry-rails'
  gem 'byebug'
  gem 'spring'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'capybara-webkit'
  gem 'selenium-webdriver'
  gem 'database_cleaner', '1.3.0'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem 'rails-controller-testing'
  gem 'json-schema'
end
