# frozen_string_literal: true

module Oughta
  module RSpec
    module Presenters
      class ModelPresenter
        ##
        #
        REFLECTION_REGEXP = /ActiveRecord::Reflection::(?<assoc_name>.+)Reflection/.freeze

        ##
        #
        VALIDATOR_REGEXP = /Active(Model|Record)::/.freeze

        attr_reader :model

        def initialize(model)
          @model = model
        end

        def rspec_validation_assertions
          model.validators.map do |validator|
            klass_name = validator.class.name.gsub(VALIDATOR_REGEXP, "")
            options = validator.options
            attributes = validator.attributes
            validator_klass = RSpec.const_get(klass_name)

            attributes.map do |validated_attribute|
              validator_klass.new(attribute: validated_attribute,
                                  options: options).to_shoulda
            end.join("\n")
          end.flatten.join("\n\n")
        end

        def rspec_association_assertions
          model.reflect_on_all_associations.map do |association_reflection|
            klass_name = association_reflection.class.name
            assoc_name = "#{klass_name.match(REFLECTION_REGEXP)[:assoc_name]}Association"
            association_klass = RSpec::Associations.const_get(assoc_name)
            association_klass.new(association_name: association_reflection.name,
                                  options: association_reflection.options).to_shoulda
          end.join("\n")
        end
      end
    end
  end
end
