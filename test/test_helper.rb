require 'simplecov'

SimpleCov.start

# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require File.expand_path("../../test/dummy/config/environment.rb",  __FILE__)
ActiveRecord::Migrator.migrations_paths = [File.expand_path("../../test/dummy/db/migrate", __FILE__)]
ActiveRecord::Migrator.migrations_paths << File.expand_path('../../db/migrate', __FILE__)
require "rails/test_help"

# Filter out Minitest backtrace while allowing backtrace from other libraries
# to be shown.
Minitest.backtrace_filter = Minitest::BacktraceFilter.new

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.respond_to?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
  ActiveSupport::TestCase.fixtures :all
end

module KnockRails3
  class MyCustomException < StandardError
  end
end

# Make sure KnockRails3 global configuration is reset before every tests
# to avoid order dependent failures.
class ActiveSupport::TestCase
  setup :reset_KnockRails3_configuration

  private

  def reset_KnockRails3_configuration
    KnockRails3.token_signature_algorithm = 'HS256'
    KnockRails3.token_secret_signature_key = -> { Rails.application.secrets.secret_key_base }
    KnockRails3.token_public_key = nil
    KnockRails3.token_audience = nil
    KnockRails3.token_lifetime = 1.day
  end
end
