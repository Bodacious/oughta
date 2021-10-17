# frozen_string_literal: true

module Oughta
  module Generators
    require "rails/generators"
    require "oughta/rspec/presenters"
    class ModelSpecGenerator < ::Rails::Generators::NamedBase
      DESCRIBE_INDENTATION = 2
      ASSERT_INDENTATION = 4

      ##
      # Opening code for the associations description block
      DESCRIBE_ASSOCIATIONS_OPEN = %(describe "associations" do\n)

      ##
      # Opening code for the validations description block
      DESCRIBE_VALIDATIONS_OPEN = %(describe "validations" do\n)

      source_root File.expand_path("templates", __dir__)

      desc "This generator creates missing model specs and populates "\
           "them with automatically generated assertions"

      def create_model_spec_file
        template "model_spec.rb.erb", spec_file_path unless File.exist?(spec_file_path)
      end

      def add_namespace_blocks
        add_association_namespace_block unless associations_defined?
        add_validation_namespace_block unless validations_defined?
      end

      def add_association_assertions
        inject_into_file spec_file_path,
                         optimize_indentation(associations_code, ASSERT_INDENTATION),
                         after: DESCRIBE_ASSOCIATIONS_OPEN,
                         verbose: true,
                         force: false
      end

      def add_validation_assertions
        inject_into_file spec_file_path,
                         optimize_indentation(validations_code, ASSERT_INDENTATION),
                         after: DESCRIBE_VALIDATIONS_OPEN,
                         verbose: true,
                         force: false
      end

      private

      def association_namespace_block
        <<~RUBY
          describe "associations" do
          end
        RUBY
      end

      def validation_namespace_block
        <<~RUBY
          describe "validations" do
          end
        RUBY
      end

      def spec_definition
        Regexp.new("RSpec.describe #{name}, type: :model do\n")
      end

      def add_association_namespace_block
        inject_into_file spec_file_path,
                         optimize_indentation(association_namespace_block,
                                              DESCRIBE_INDENTATION),
                         after: spec_definition,
                         verbose: false,
                         force: false
      end

      def add_validation_namespace_block
        inject_into_file spec_file_path,
                         optimize_indentation(validation_namespace_block,
                                              DESCRIBE_INDENTATION),
                         after: spec_definition,
                         verbose: false,
                         force: false
      end

      def model_presenter
        @model_presenter ||= RSpec::Presenters::ModelPresenter.new(Object.const_get(name))
      end

      def validations_code
        model_presenter.rspec_validation_assertions
      end

      def associations_code
        model_presenter.rspec_association_assertions
      end

      def spec_file_path
        Pathname(File.join(destination_root, "spec/models/#{name.underscore}_spec.rb"))
      end

      def associations_defined?
        file_content.include?(DESCRIBE_ASSOCIATIONS_OPEN)
      end

      def validations_defined?
        file_content.include?(DESCRIBE_VALIDATIONS_OPEN)
      end

      def file_content
        File.read(spec_file_path).to_s
      end
    end
  end
end
