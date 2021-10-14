module Oughta
  module RSpec
    module Associations
      require_relative "association"

      class BelongsToAssociation < Association
        MACRO_TEMPLATE = "belong_to(:%{association_name})"

        supports_options :class_name,
                         :foreign_key,
                         :polymorphic,
                         :primary_key,
                         :dependent,
                         :counter_cache,
                         :touch,
                         :autosave,
                         :inverse_of,
                         :required,
                         :optional

        private

        def option_string_for_polymorphic
          ""
        end

        def option_string_for_dependent
          "dependent(:#{options[:dependent]})"
        end

        def option_string_for_primary_key
          "with_primary_key(:#{options[:primary_key]})"
        end

        def option_string_for_counter_cache
          "counter_cache(#{options[:counter_cache].inspect})"
        end

        def option_string_for_touch
          "touch(#{options[:touch]})"
        end

        def option_string_for_autosave
          "autosave(#{options[:autosave]})"
        end

        def option_string_for_required
          if options[:required] == true
            "required"
          else
            "optional"
          end
        end

        def option_string_for_optional
          if options[:optional] == true
            "optional"
          else
            "required"
          end
        end

        def option_string_for_inverse_of
          "inverse_of(#{options[:inverse_of].inspect})"
        end
      end
    end
  end
end
