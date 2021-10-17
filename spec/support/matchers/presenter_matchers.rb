# frozen_string_literal: true

module Oughta
  module Specs
    module Matchers
      module PresenterMatchers
        rspec = ::RSpec
        extend rspec::Matchers::DSL

        require "rspec/expectations"

        matcher :define_expectation do |macro_name|
          match do |actual|
            @expectation = if attribute_name?
                             "#{macro_name}(:#{attribute_name})"
                           else
                             macro_name.to_s
                           end
            @expectation.concat(options_chain.to_s)
            actual.include?(@expectation)
          end

          chain :for_attribute do |attr_name|
            @attribute_name = attr_name
          end

          chain :with_options do |options_hash|
            @options_hash = options_hash
          end

          description do
            "define `#{@expectation}`"
          end

          failure_message do
            "It should #{description} but did not.\nWas:\n\n#{actual}"
          end

          def attribute_name?
            defined?(@attribute_name)
          end

          def attribute_name
            @attribute_name.to_s
          end

          def options_chain
            @options_chain ||= Hash(@options_hash).to_s
          end
        end
      end
    end
  end
end
