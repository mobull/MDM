source 'https://rubygems.org'

gem 'rails', '3.2.9'
gem 'jquery-rails'
gem 'devise'
gem 'slim-rails'
gem 'cancan'
gem 'strong_parameters'
gem 'rails-backbone'
gem 'formtastic'

group :development do
  gem 'guard-rspec'
  gem 'guard-spork'
  gem 'rb-fsevent', require: false
  gem 'rb-inotify', require: false
end

group :test do
  gem 'simplecov', require: false
end

group :test, :development do
  gem 'sqlite3'
  gem "rspec-rails", "~> 2.0"
  gem 'spork-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'jasmine'
  gem 'guard-jasmine'
  gem 'jasminerice'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
  gem 'skim'
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'
