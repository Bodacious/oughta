# frozen_string_literal: true

module Oughta
  module RSpec
    module Validations
      ##
      # Take an ActiveRecord::Validations::PresenceValidator and represent it as a
      # Shoulda RSpec String
      #
      class PresenceValidator < RSpec::Macro
        attr_reader :attribute, :options

        def initialize(attribute:, options: [])
          super
          @attribute = attribute.to_sym
          @options = options
        end

        private

        def macro_call
          "validate_presence_of(#{attribute.inspect})"
        end

        def options_method_chain
          array = [""] + options.each_key.map { |key| send(:"option_string_for_#{key}") }
          array.sort.join(".")
        end

        def option_string_for_allow_nil
          "allow_nil"
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
