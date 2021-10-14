# frozen_string_literal: true

module Oughta
  ##
  # Generate Shoulda matchers in the RSpec test format
  module RSpec
    require_relative "rspec/macro"
    require_relative "rspec/validations"
    require_relative "rspec/associations"
  end
end
