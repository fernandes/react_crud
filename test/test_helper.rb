ENV['RAILS_ENV'] ||= 'test'

puts "test helper #{ENV['COVERAGE']}"

if ENV['COVERAGE'] == 'true'
  require 'simplecov'
  SimpleCov.start :rails do
    add_filter "/bin/"
  end
  Rails.application.eager_load!
end

require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
