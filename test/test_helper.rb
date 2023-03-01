require 'simplecov'

if ENV['CI']
  SimpleCov.start do
    if ENV['COVERAGE']
      require 'simplecov-lcov'

      SimpleCov::Formatter::LcovFormatter.config do |c|
        c.report_with_single_file = true
        c.single_report_path = 'coverage/lcov.info'
      end

      formatter SimpleCov::Formatter::LcovFormatter
    end

    add_filter ['version.rb', 'initializer.rb', 'config.rb']
  end
end

ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  include AuthHelper
  include ActionMailer::TestHelper

  # Run tests in parallel with specified workers
  # Disable parallelization if only coverage computing
  # The SimpleCov issue description: https://github.com/simplecov-ruby/simplecov/issues/718
  ENV['RAILS_ENV'] || parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  # fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryBot::Syntax::Methods
end
