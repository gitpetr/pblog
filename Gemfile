source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.1.1'


gem 'puma', '~> 3.7'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'therubyracer', platforms: :ruby

gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'



group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'sqlite3'
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'rspec-rails', '~> 3.6'
  gem 'factory_girl_rails'
  gem 'selenium-webdriver'
  gem 'pry-rails'
end

group :development do
  gem 'capistrano-rails'
  gem 'capistrano3-puma'
  gem 'capistrano-rvm'
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener', '~> 1.4', '>= 1.4.1'
  gem 'letter_opener_web', '~> 1.3', '>= 1.3.1'
end

group :production do
  gem 'pg'
end

gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails', '~> 4.3', '>= 4.3.1'
gem 'font-awesome-rails'
gem 'httparty'
gem 'high_voltage', '~> 3.0.0'
gem 'haml-rails'
gem 'devise'
gem 'noty-rails'
gem 'rails-settings-cached', '~> 0.6.6'
gem 'simple_form', '~> 3.5'
gem 'friendly_id', '~> 5.2', '>= 5.2.3'
gem 'babosa', '~> 1.0', '>= 1.0.2'
