$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "knock_rails3/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "KnockRails3"
  s.version     = KnockRails3::VERSION
  s.authors     = ["Hussein", "Rudy"]
  s.email       = ["engineering@lynks.com"]
  s.homepage    = "https://github.com/Lynks/Knock-rails3"
  s.summary     = "Seamless JWT authentication for Rails 3 API."
  s.description = "Authentication solution for Rails 3 based on JWT"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", '3.2.22.1'
  s.add_dependency "jwt", "~> 1.5"
  s.add_dependency "bcrypt", "~> 3.1"

  s.add_development_dependency "sqlite3", "~> 1.3"
  s.add_development_dependency "timecop", "~> 0.8.0"
end
