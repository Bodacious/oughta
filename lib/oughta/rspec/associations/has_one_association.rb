# frozen_string_literal: true

module Oughta
  module RSpec
    module Associations
      require_relative "has_association"

      class HasOneAssociation < Association
        include HasAssociation

        MACRO_TEMPLATE = %{have_one(:%{association_name})}

        supports_options :class_name,
                         :dependent,
                         :primary_key,
                         :foreign_key,
                         :through,
                         :source,
                         :validate,
                         :autosave,
                         :required

        def option_string_for_required
          if options[:required] == true
            "required"
          else
            "optional"
          end
        end
      end
    end
  end
end
