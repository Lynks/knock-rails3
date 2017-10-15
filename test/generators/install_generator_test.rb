require "test_helper"

class InstallGeneratorTest < Rails::Generators::TestCase
  tests KnockKnock::InstallGenerator
  destination File.expand_path("../tmp", File.dirname(__FILE__))
  setup :prepare_destination

  test "Assert all files are properly created" do
    run_generator
    assert_file "config/initializers/KnockKnock.rb"
  end
end
