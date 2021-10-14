# frozen_string_literal: true

module Oughta
  module RSpec
    ##
    # Decorators for Shouda validation matchers
    module Validations
      Dir["#{__dir__}/associations/*_association.rb"].each do |association|
        require_relative association.to_s
      end
    end
  end
end
