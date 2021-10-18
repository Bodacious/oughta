module Oughta
  module RSpec
    module Associations
      class HasAndBelongsToManyAssociation < Association
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
