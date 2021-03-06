source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end if Bundler::VERSION < '2'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '>= 5.0.0.beta3', '< 5.1'
# Use sqlite3 as the database for Active Record
# Use Puma as the app server
gem 'puma'
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
# Turbolinks makes navigating your web application faster.
# Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.x'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'devise', github: 'plataformatec/devise', branch: 'master'
gem 'formtastic'
gem 'cocoon'
gem 'formtastic-bootstrap'
gem 'browserify-rails'

# use this fork of closure_tree until closure_tree#195 is fixed
gem 'closure_tree', github: 'jayfredlund/closure_tree'

gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'font-awesome-sass'

gem 'rollbar', '~> 2.8.1'
gem 'oj', '~> 2.12.14'

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and
  # get a debugger console
  gem 'sqlite3'
  gem 'byebug'
  gem 'rspec-rails', '~> 3.5.0.beta1'
  gem 'capybara'
  gem 'factory_girl_rails'
  gem 'launchy'
  # until https://github.com/DatabaseCleaner/database_cleaner/pull/415
  # gets released
  gem 'database_cleaner', github: 'DatabaseCleaner/database_cleaner'
  gem 'rails-controller-testing'
  gem 'poltergeist'
  gem 'dotenv-rails', require: 'dotenv/rails-now'
  gem 'rubocop', require: false
  gem 'rubocop-rspec'
end

group :test do
  gem 'codeclimate-test-reporter', require: nil
end

group :development do
  # Access an IRB console on exception pages or by
  # using <%= console %> in views
  gem 'web-console', '~> 3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running
  # in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
