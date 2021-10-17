# frozen_string_literal: true

module Oughta
  module Specs
    module Matchers
      module GeneratorMatchers
        extend ::RSpec::Matchers::DSL
        include FileUtils

        matcher :be_an_existing_file do
          match do |_filename|
            absolute = File.expand_path(actual, destination_root)
            File.exist?(absolute)
          end

          failure_message do
            "Expected file #{actual} to exist, but does not"
          end
        end
      end
    end
  end
end
