# frozen_string_literal: true

require "uri"

require_relative "lib/oughta/version"

Gem::Specification.new do |spec|
  spec.name          = "oughta"
  spec.version       = Oughta::VERSION
  spec.authors       = ["bodacious"]
  spec.email         = ["gavin@gavinmorrice.com"]

  spec.summary       = "wip: Come back here in a few days"
  spec.description   = "Automatically generate shoulda-rspec tests"
  spec.homepage      = "https://github.com/Bodacious/oughta"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.5")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = spec.homepage
  spec.metadata["changelog_uri"] = URI.join(spec.homepage, "blob/CHANGELOG.md").to_s

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{\A(?:test|spec|features)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_dependency "rails"
  spec.add_dependency "thor"

  spec.add_development_dependency "activerecord", ">= 6.0"
  spec.add_development_dependency "activesupport", ">= 6.0"
  spec.add_development_dependency "bundler-audit", "~> 0.7.0.1"
  spec.add_development_dependency "byebug", "~> 11.1.3"
  spec.add_development_dependency "guard-rspec"
  spec.add_development_dependency "rake", "~> 13.0.3"
  spec.add_development_dependency "rspec", "~> 3.10.0"
  spec.add_development_dependency "rubocop", "~> 0.92.0"
  spec.add_development_dependency "rubocop-rspec", "~> 1.44.1"
  spec.add_development_dependency "simplecov", "~> 0.21.2"
  spec.add_development_dependency "sqlite3", "~> 1.4.2"
end
