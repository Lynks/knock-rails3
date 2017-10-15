require 'rails/generators'

module KnockRails3
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path("../../templates", __FILE__)

    desc "Creates a KnockRails3 initializer."

    def copy_initializer
      template 'knock_rails3.rb', 'config/initializers/knock_rails3.rb'
    end
  end
end
