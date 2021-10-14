# frozen_string_literal: true


module Oughta
  module RSpec
    require_relative "validator"
    module Validations
      ##
      # Take an ActiveRecord::Validations::ConfirmationValidator and represent
      # it as a Shoulda RSpec String.
      #
      class ConfirmationValidator < Validator
        MACRO_TEMPLATE = "validate_confirmation_of(:%{attribute})"

        supports_options :message, :on
      end
    end
  end
end
