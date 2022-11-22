source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.4', '>= 6.1.4.4'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Use SCSS for stylesheets
gem 'sass-rails', '>= 6'
# Transpile app-like JavaScript. Read more: https://github.com/rails/webpacker
gem 'webpacker', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Ruby gem for password encryption
gem 'bcrypt', '~> 3.1.7'
# Simple Form aims to be as flexible as possible while helping you with powerful components to create your forms.
gem 'simple_form'
# State Machines adds support for creating state machines for attributes on any Ruby class.
gem 'state_machines'
# Adds support for database transactions, automatically saving the record, named scopes, validation errors.
gem 'state_machines-activerecord'
# Gem slim-rails provides Slim generators for Rails 3+. It was based on haml-rails and it does basically the same
gem 'slim-rails'
# A Scope & Engine based, clean, powerful, customizable and sophisticated paginator for modern web app frameworks and ORMs
gem 'kaminari'
# Ransack do easily add searching to Rails application, without any additional dependencies.
# Bleeding edge - If you would like to use the latest updates not yet published to RubyGems, use the main branch
gem 'ransack', github: 'activerecord-hackery/ransack', branch: 'main'
# A set of Rails responders to dry up application
gem 'responders'
# ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers'
# Webpacker-React makes it easy to use React with Webpacker in your Rails applications.
gem 'webpacker-react', '~> 0.3.2'
# Generates javascript file that defines all Rails named routes as javascript helpers
gem 'js-routes'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # RuboCop is a Ruby static code analyzer (a.k.a. linter) and code formatter.
  # Out of the box it will enforce many of the guidelines outlined in the community Ruby Style Guide.
  gem 'rubocop'
  # Rubocop for Rails
  gem 'rubocop-rails'
  # Faker, a port of Data::Faker from Perl, is used to easily generate fake data: names, addresses, phone numbers, etc.
  # Gem adds real-looking test data, and having your database populated with more than one or two records while you're doing development.
  gem 'faker', '~> 2.23'
  # Provides Rails integration for factory_bot.
  # Factory_bot is a fixtures replacement with a straightforward definition syntax,
  # support for multiple build strategies, and factories for the same class, including factory inheritance.
  gem 'factory_bot_rails'
  # The Bullet gem help increase application's performance by reducing the number of queries it makes.
  # Watch queries and notify you when add eager loading (N+1 queries).
  gem 'bullet'
  # The Coveralls.io in 2011 along with the original Ruby gem.
  # Since 2017 the community members have taken up the charge of maintaining and building upon the original.
  # Tagliala github repo: https://github.com/tagliala/coveralls-ruby-reborn
  gem 'coveralls_reborn', '~> 0.25.0', require: false
  # Simplecov package with all the options for Rails
  gem 'simplecov-lcov', '~> 0.8.0', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 4.1.0'
  # Display performance information such as SQL time and flame graphs for each request in your browser.
  # Can be configured to work on production as well see: https://github.com/MiniProfiler/rack-mini-profiler/blob/master/README.md
  gem 'rack-mini-profiler', '~> 2.0'
  gem 'listen', '~> 3.3'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 3.26'
  gem 'selenium-webdriver'
  # Easy installation and use of web drivers to run system tests with browsers
  gem 'webdrivers'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
