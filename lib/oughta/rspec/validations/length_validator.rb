# frozen_string_literal: true

require_relative "validator"

module Oughta
  module RSpec
    module Validations
      ##
      # Take an ActiveRecord::Validations::LengthValidator and represent it
      # as a Shoulda RSpec String
      #
      class LengthValidator < Validator
        ##
        #
        IS_TEMPLATE = "is_equal_to(%{is})"

        ##
        #
        MACRO_TEMPLATE = "validate_length_of(:%{attribute})"

        supports_options :allow_blank, :allow_nil, :in, :is, :maximum, :message,
                         :minimum, :on, :too_short, :too_long

        private

        def option_string_for_in
          min = options[:in].first
          max = options[:in].last
          "is_at_least(#{min}).is_at_most(#{max})"
        end

        def option_string_for_is
          "is_equal_to(#{options[:is]})"
        end

        def option_string_for_minimum
          "is_at_least(#{options[:minimum]})"
        end

        def option_string_for_maximum
          "is_at_most(#{options[:maximum]})"
        end

        def option_string_for_too_long
          "with_long_message(#{options[:too_long].inspect})"
        end

        def option_string_for_too_short
          "with_short_message(#{options[:too_short].inspect})"
        end
      end
    end
  end
end
