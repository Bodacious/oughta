# frozen_string_literal: true


module Oughta
  module RSpec
    require_relative "validator"
    module Validations
      ##
      # Take an ActiveRecord::Validations::PresenceValidator and represent it as a
      # Shoulda RSpec String
      #
      class PresenceValidator < Validator
        ##
        #
        MACRO_TEMPLATE = "validate_presence_of(:%{attribute})"

        supports_options :allow_nil, :message, :on
      end
    end
  end
end
