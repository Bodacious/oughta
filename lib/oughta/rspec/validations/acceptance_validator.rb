# frozen_string_literal: true

require_relative "validator"

module Oughta
  module RSpec
    module Validations
      ##
      # Take an ActiveRecord::Validations::AcceptanceValidator and represent it
      # as a Shoulda RSpec String
      #
      class AcceptanceValidator < Validator


        MACRO_TEMPLATE = "validate_acceptance_of(:%{attribute})".freeze

        supports_options :message, :on

      end
    end
  end
end
