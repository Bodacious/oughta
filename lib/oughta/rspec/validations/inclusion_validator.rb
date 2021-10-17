# frozen_string_literal: true

module Oughta
  module RSpec
    require_relative "validator"
    module Validations
      ##
      # Take an ActiveRecord::Validations::InclusionValidator and represent it
      # as a Shoulda RSpec String
      #
      class InclusionValidator < Validator
        MACRO_TEMPLATE = "validate_inclusion_of(:%{attribute})"

        supports_options :allow_blank, :allow_nil, :message, :on, :in

        def option_string_for_in
          "in_range(#{options[:in]})"
        end
      end
    end
  end
end
