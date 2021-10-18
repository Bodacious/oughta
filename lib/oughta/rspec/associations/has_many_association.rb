# frozen_string_literal: true

module Oughta
  module RSpec
    module Associations
      require_relative "association"
      require_relative "has_association"

      class HasManyAssociation < Association
        include HasAssociation

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

        def index_errors
          "index_errors(#{options[:index_errors]})"
        end

        def option_string_for_polymorphic
          ""
        end

        def option_string_for_counter_cache
          "counter_cache(#{options[:counter_cache].inspect})"
        end

        def option_string_for_touch
          "touch(#{options[:touch]})"
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
