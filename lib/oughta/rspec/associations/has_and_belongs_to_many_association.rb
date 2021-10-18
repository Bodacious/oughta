# frozen_string_literal: true

module Oughta
  module RSpec
    module Associations
      require_relative "has_association"

      class HasAndBelongsToManyAssociation < Association
        include HasAssociation

        MACRO_TEMPLATE = %{have_and_belong_to_many(:%{association_name})}

        supports_options :class_name,
                         :join_table,
                         :validate,
                         :autosave

        def option_string_for_join_table
          "join_table(#{options[:join_table].inspect})"
        end
      end
    end
  end
end
