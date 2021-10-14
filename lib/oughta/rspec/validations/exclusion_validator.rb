# frozen_string_literal: true


module Oughta
  module RSpec
    require_relative "validator"
    module Validations
      ##
      # Take an ActiveRecord::Validations::ExclusionValidator and represent it
      # as a Shoulda RSpec String
      #
      class ExclusionValidator < Validator
        MACRO_TEMPLATE = "validate_exclusion_of(:%{attribute})"

        supports_options :message, :on
      end
    end
  end
end
