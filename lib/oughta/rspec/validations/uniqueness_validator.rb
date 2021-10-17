# frozen_string_literal: true

module Oughta
  module RSpec
    require_relative "validator"
    module Validations
      ##
      # Take an ActiveRecord::Validations::PresenceValidator and represent it as a
      # Shoulda RSpec String
      #
      class UniquenessValidator < Validator
        ##
        #
        MACRO_TEMPLATE = "validate_uniqueness_of(:%{attribute})"

        supports_options :scope, :message, :on, :case_sensitive

        default_options case_sensitive: true

        def option_string_for_scope
          "scoped_to(#{options[:scope].inspect})"
        end
      end
    end
  end
end
