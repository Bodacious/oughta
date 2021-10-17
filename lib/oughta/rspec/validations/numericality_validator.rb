# frozen_string_literal: true

module Oughta
  module RSpec
    require_relative "validator"
    module Validations
      ##
      # Take an ActiveRecord::Validations::NumericalityValidator and represent it as a
      # Shoulda RSpec String
      class NumericalityValidator < Validator
        MACRO_TEMPLATE = "validate_numericality_of(:%{attribute})"

        supports_options :allow_nil, :equal_to, :even, :greater_than,
                         :greater_than_or_equal_to, :less_than, :less_than_or_equal_to,
                         :message, :other_than, :on, :odd, :only_integer

        private

        def option_string_for_equal_to
          "is_equal_to(#{options[:equal_to]})"
        end

        def option_string_for_even
          "even" if options[:even]
        end

        def option_string_for_odd
          "odd" if options[:odd]
        end

        def option_string_for_greater_than
          "is_greater_than(#{options[:greater_than]})"
        end

        def option_string_for_greater_than_or_equal_to
          "is_greater_than_or_equal_to(#{options[:greater_than_or_equal_to]})"
        end

        def option_string_for_less_than
          "is_less_than(#{options[:less_than]})"
        end

        def option_string_for_less_than_or_equal_to
          "is_less_than_or_equal_to(#{options[:less_than_or_equal_to]})"
        end

        def option_string_for_other_than
          "is_other_than(#{options[:other_than]})"
        end

        def option_string_for_only_integer
          "only_integer" if options[:only_integer]
        end
      end
    end
  end
end
