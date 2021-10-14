# frozen_string_literal: true


module Oughta
  module RSpec
    require_relative "validator"
    module Validations
      ##
      # Take an ActiveRecord::Validations::AcceptanceValidator and represent it
      # as a Shoulda RSpec String
      #
      class AcceptanceValidator < Validator
        MACRO_TEMPLATE = "validate_acceptance_of(:%{attribute})"

        supports_options :message, :on
      end
    end
  end
end
