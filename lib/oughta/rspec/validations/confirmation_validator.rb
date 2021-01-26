# frozen_string_literal: true

require_relative "validator"

module Oughta
  module RSpec
    module Validations
      ##
      # Take an ActiveRecord::Validations::ConfirmationValidator and represent
      # it as a Shoulda RSpec String.
      #
      class ConfirmationValidator < Validator
        MACRO_TEMPLATE = "validate_confirmation_of(:%{attribute})".freeze

        supports_options :message, :on
      end
    end
  end
end
