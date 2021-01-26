# frozen_string_literal: true

module Oughta
  module RSpec
    module Validations
      ##
      # Base class for a validator
      #
      class Validator < RSpec::Macro
        attr_reader :attribute, :options

        def self.supports_options(*args)
          args.each { |arg| support_option(arg) }
        end

        def self.support_option(option_name)
          supported_options << option_name.to_sym
        end

        def self.supported_options
          @supported_options ||= Set.new
        end

        def self.supports_option?(option_name)
          supported_options.include?(option_name.to_sym)
        end

        def initialize(attribute:, options: [])
          super
          @attribute = attribute.to_sym
          @options = options
        end

        private

        def template_constant_get(name)
          self.class.const_get("#{name}_TEMPLATE")
        end

        def options_method_chain
          array = options.each_key.map do |key|
            if self.class.supports_option?(key)
              send(:"option_string_for_#{key}")
            else
              raise ArgumentError,
                    "option #{key.inspect} is not supported by #{self.class}"
            end
          end
          array.unshift("") # provides a "." for first method in chain
          array.compact.sort.join(".")
        end

        def macro_call
          self.class.const_get("MACRO_TEMPLATE") % { attribute: attribute }
        end

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
