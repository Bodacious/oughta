# frozen_string_literal: true

module Oughta
  module RSpec
    module Associations
      class Association < RSpec::Macro
        attr_reader :association_name, :options

        def initialize(association_name:, options: [])
          @association_name = association_name.to_sym
          @options = options
        end

        def macro_call
          self.class.const_get("MACRO_TEMPLATE") % { association_name: association_name }
        end

        private

        def option_string_for_class_name
          "class_name(:#{options[:class_name]})"
        end

        def option_string_for_foreign_key
          "with_foreign_key(:#{options[:foreign_key]})"
        end
      end
    end
  end
end
