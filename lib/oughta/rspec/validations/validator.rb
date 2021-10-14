# frozen_string_literal: true

module Oughta
  module RSpec
    module Validations
      ##
      # Base class for a validator
      #
      class Validator < RSpec::Macro

        attr_reader :attribute
        
        def initialize(attribute:, options: [])
          @attribute = attribute.to_sym
          @options = options
        end

        private


        def option_string_for_allow_blank
          "allow_blank" if options[:allow_blank]
        end

        def option_string_for_allow_nil
          "allow_nil" if options[:allow_nil]
        end

        def option_string_for_message
          "with_message(#{options[:message].inspect})"
        end

        def option_string_for_on
          "on(#{options[:on].inspect})"
        end
      end
    end
  end
end
