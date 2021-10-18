# frozen_string_literal: true

module Oughta
  module RSpec
    module Associations
      module HasAssociation
        def option_string_for_dependent
          "dependent(:#{options[:dependent]})"
        end

        def option_string_for_through
          "through(#{options[:through].inspect})"
        end

        def option_string_for_source
          "source(#{options[:source].inspect})"
        end

        def option_string_for_primary_key
          "with_primary_key(:#{options[:primary_key]})"
        end
      end
    end
  end
end
