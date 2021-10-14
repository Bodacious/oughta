# frozen_string_literal: true


module Oughta
  module RSpec
    require_relative "validator"
    module Validations
      ##
      # Take an ActiveRecord::Validations::AbsenceValidator and represent it as
      # a Shoulda RSpec String
      #
      class AbsenceValidator < Validator
        MACRO_TEMPLATE = "validate_absence_of(:%{attribute})"

        supports_options :message, :on
      end
    end
  end
end
