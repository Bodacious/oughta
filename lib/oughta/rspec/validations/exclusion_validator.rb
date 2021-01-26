# frozen_string_literal: true

require_relative "validator"

module Oughta
  module RSpec
    module Validations
      ##
      # Take an ActiveRecord::Validations::ExclusionValidator and represent it
      # as a Shoulda RSpec String
      #
      class ExclusionValidator < Validator
        MACRO_TEMPLATE = "validate_exclusion_of(:%{attribute})".freeze

        supports_options :message, :on
      end
    end
  end
end
