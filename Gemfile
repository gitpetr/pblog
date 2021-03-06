source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.1'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'therubyracer', platforms: :ruby
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5'
gem 'turbolinks', '~> 5'
gem 'babosa', '~> 1.0', '>= 1.0.2'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'devise'
gem 'font-awesome-rails'
gem 'friendly_id', '~> 5.2', '>= 5.2.3'
gem 'haml-rails'
gem 'high_voltage', '~> 3.0.0'
gem 'httparty'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'noty-rails'
gem 'rails-settings-cached', '~> 0.6.6'
gem 'simple_form', '~> 3.5'
gem 'carrierwave'
gem 'mini_magick', '~> 4.8'
gem 'ckeditor', '~> 4.2', '>= 4.2.4'
gem 'paperclip', '~> 5.1'
gem 'will_paginate', '~> 3.1', '>= 3.1.6'
gem 'will_paginate-bootstrap', '~> 1.0', '>= 1.0.1'


# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'factory_girl_rails'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.6'
end

group :test do
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.2'
  gem 'rails-controller-testing', '~> 1.0', '>= 1.0.2'
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
  gem 'database_cleaner'
end

group :development do
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'capistrano3-puma'
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
  gem 'letter_opener_web', '~> 1.3', '>= 1.3.1'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'rubocop-rails'
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end
