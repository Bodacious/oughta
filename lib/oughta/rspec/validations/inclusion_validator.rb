# frozen_string_literal: true

require_relative "validator"

module Oughta
  module RSpec
    module Validations
      ##
      # Take an ActiveRecord::Validations::InclusionValidator and represent it
      # as a Shoulda RSpec String
      #
      class InclusionValidator < Validator
        MACRO_TEMPLATE = "validate_inclusion_of(:%{attribute})"

        supports_options :allow_blank, :allow_nil, :message, :on
      end
    end
  end
end
