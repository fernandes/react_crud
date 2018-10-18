ENV['RAILS_ENV'] ||= 'test'

if ENV['COVERAGE'] == 'true'
  require 'simplecov'
  SimpleCov.start :rails do
    add_filter "/bin/"
  end

  if ENV['DISABLE_SPRING'].nil? && ENV['RAILS_SYSTEM_TEST'].nil?
    Rails.application.eager_load!
  end
end

require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end
