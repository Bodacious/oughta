# frozen_string_literal: true

module Oughta
  module RSpec
    ##
    # Decorators for Shouda validation matchers
    module Validations
      require_relative "validations/numericality_validator"
      require_relative "validations/presence_validator"
    end
  end
end
