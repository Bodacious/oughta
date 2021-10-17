# frozen_string_literal: true

module Oughta
  module Specs
    module Matchers
      module ValidatorMatchers
        rspec = ::RSpec
        extend rspec::Matchers::DSL

        require "rspec/expectations"

        matcher :return_matcher do |matcher_name|
          match do |actual|
            if defined?(@attribute_name)
              actual.include?("#{matcher_name}(:#{@attribute_name})")
            else
              actual.include?(matcher_name.to_s)
            end
          end
          chain :for_attribute do |attr_name|
            @attribute_name = attr_name
          end
          description do
            string = "define #{matcher_name}"
            string << "(:#{@attribute_name})" if defined?(@attribute_name)
            string
          end
          failure_message do
            "#{description} but did not"
          end
        end
      end
    end
  end
end
