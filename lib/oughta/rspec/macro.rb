# frozen_string_literal: true

module Oughta
  module RSpec
    ##
    # Base class for all RSpec Macros
    class Macro
      require_relative "../unsupported_option_error"
      def initialize(*args); end

      attr_reader :options

      def self.supports_options(*args)
        args.each { |arg| support_option(arg) }
      end

      def self.support_option(option_name)
        supported_options << option_name.to_sym
      end

      def self.supported_options
        @supported_options ||= Set.new
      end

      def self.supports_option?(option_name)
        supported_options.include?(option_name.to_sym)
      end

      def to_shoulda
        %(it { should #{macro_call}#{options_method_chain} })
      end


      def template_constant_get(name)
        self.class.const_get("#{name}_TEMPLATE")
      end

      def options_method_chain
        array = options.each_key.map do |key|
          if self.class.supports_option?(key)
            send(:"option_string_for_#{key}")
          else
            raise UnsupportedOptionError.new(key.inspect, self.class.name)
          end
        end
        array.unshift("") # provides a "." for first method in chain
        array.compact.sort.join(".")
      end

      def macro_call
        self.class.const_get("MACRO_TEMPLATE") % { attribute: attribute }
      end

      # def macro_call
      #   raise NotImplementedError, "Please define macro_call in #{self}"
      # end
      #
      # def options_method_chain
      #   raise NotImplementedError, "Please define options_method_chain in #{self}"
      # end
    end
  end
end
