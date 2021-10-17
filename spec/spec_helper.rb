# frozen_string_literal: true

require "simplecov"
SimpleCov.minimum_coverage 80
SimpleCov.start

require "byebug"

require "oughta/rspec"
require "support/association_spec"
require "support/validator_spec"
require "support/matchers"
require "support/generators"

Dir["#{__dir__}/support/shared_examples/**/*.rb"].each do |filepath|
  require filepath.gsub(%r{\Aspec/}, "")
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = ".rspec_status"

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
