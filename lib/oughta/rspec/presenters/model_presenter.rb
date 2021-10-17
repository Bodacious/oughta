# frozen_string_literal: true

module Oughta
  module RSpec
    module Presenters
      class ModelPresenter
        attr_reader :model

        def initialize(model)
          @model = model
        end

        def to_rspec
          model.validators.map do |validator|
            klass_name = validator.class.name.gsub(/Active(Model|Record)::/, "")
            options = validator.options
            attributes = validator.attributes
            validator_klass = RSpec.const_get(klass_name)

            attributes.map do |validated_attribute|
              validator_klass.new(attribute: validated_attribute,
                                  options: options).to_shoulda
            end.join("\n  ")
          end.flatten.join("\n\n  ")
        end
      end
    end
  end
end
