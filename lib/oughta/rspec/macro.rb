# frozen_string_literal: true

module Oughta
  module RSpec
    ##
    # Base class for all RSpec Macros
    class Macro
      def initialize(*args); end

      def to_shoulda
        %(it { should #{macro_call}#{options_method_chain} })
      end

      def macro_call
        raise NotImplementedError, "Please define macro_call in #{self}"
      end

      def options_method_chain
        raise NotImplementedError, "Please define options_method_chain in #{self}"
      end
    end
  end
end
