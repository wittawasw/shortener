source 'https://rubygems.org'
ruby '2.2.3'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# gem 'rails-api'
# Use postgresql as the database for Active Record
gem 'pg'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


# Serializer Object for API usage
gem 'active_model_serializers', '~> 0.10.0.rc2'

# Bootswatch theme
gem 'bootswatch-sass', '~> 3.3.0'

# Javascript lib
gem 'angularjs-rails'
gem 'nprogress-rails'

gem 'kaminari'

# Queueing
gem 'sidekiq'
gem 'redis-namespace'
gem 'sinatra' # sidekiq web dependency

group :production do
  gem 'puma'
end

group :development do
  gem 'thin'
  gem 'better_errors'
  gem 'binding_of_caller'
end

group :development, :test do
  gem 'pry-rails'
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'rspec-rails'
  gem 'capybara'
  gem 'selenium-webdriver'
  gem 'database_cleaner', '1.3.0'
end

group :test do
  gem 'shoulda-matchers', require: false
  gem "json-schema"
end
