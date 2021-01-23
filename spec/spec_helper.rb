# frozen_string_literal: true

require "simplecov"
SimpleCov.minimum_coverage 80
SimpleCov.start

require "byebug"

require "oughta/rspec"
require "support/validator_spec"
Dir["spec/support/shared_contexts/**/*.rb"].each do |filepath|
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
