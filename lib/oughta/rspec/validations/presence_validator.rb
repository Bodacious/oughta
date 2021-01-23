# frozen_string_literal: true

module Oughta
  module RSpec
    module Validations
      require_relative "validator"
      ##
      # Take an ActiveRecord::Validations::PresenceValidator and represent it as a
      # Shoulda RSpec String
      #
      class PresenceValidator < Validator

        supports_options :allow_nil, :message, :on

        private

        def macro_call
          "validate_presence_of(#{attribute.inspect})"
        end

      end
    end
  end
end
