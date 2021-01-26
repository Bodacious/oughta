# frozen_string_literal: true

module Oughta
  module RSpec
    ##
    # Decorators for Shouda validation matchers
    module Validations
      Dir["#{__dir__}/validations/*_validator.rb"].each do |validator|
        require_relative "#{validator}"
      end
    end
  end
end
