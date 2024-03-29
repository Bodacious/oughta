# frozen_string_literal: true

module Oughta
  module RSpec
    module Associations
      class Association < RSpec::Macro
        attr_reader :association_name

        def initialize(association_name:, options: [])
          super(options: options)
          @association_name = association_name.to_sym
        end

        def macro_call
          self.class.const_get("MACRO_TEMPLATE") % { association_name: association_name }
        end

        private

        def option_string_for_autosave
          "autosave(#{options[:autosave]})"
        end

        def option_string_for_validate
          "validate(#{options[:validate]})"
        end

        def option_string_for_index_errors
          "index_errors(#{options[:index_errors]})"
        end

        def option_string_for_class_name
          "class_name(:#{options[:class_name]})"
        end

        def option_string_for_foreign_key
          "with_foreign_key(:#{options[:foreign_key]})"
        end

        def option_string_for_inverse_of
          "inverse_of(#{options[:inverse_of].inspect})"
        end
      end
    end
  end
end
