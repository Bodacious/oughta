# frozen_string_literal: true

module Oughta
  module RSpec
    module Associations
      require_relative "association"

      class HasManyAssociation < Association
        MACRO_TEMPLATE = "have_many(:%{association_name})"

        supports_options :class_name,
                         :foreign_key,
                         :polymorphic,
                         :primary_key,
                         :dependent,
                         :counter_cache,
                         :touch,
                         :autosave,
                         :inverse_of,
                         :through,
                         :source,
                         :index_errors,
                         :validate

        private

        def option_string_for_through
          "through(#{options[:through].inspect})"
        end

        def option_string_for_source
          "source(#{options[:source].inspect})"
        end

        def index_errors
          "index_errors(#{options[:index_errors]})"
        end

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
      end
    end
  end
end
