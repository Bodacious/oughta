# frozen_string_literal: true

module Oughta
  module Specs
    module Generators
      require "active_support/concern"
      require "rails/generators/testing/behaviour"
      require "rails/generators/testing/setup_and_teardown"
      require "rails/generators/testing/assertions"
      require_relative "test_model"
      extend ActiveSupport::Concern

      included do
        include Rails::Generators::Testing::Behaviour
        include Rails::Generators::Testing::SetupAndTeardown
        include Rails::Generators::Testing::Assertions
        include FileUtils

        tests described_class

        set_default_destination

        before { prepare_destination }
      end

      module ClassMethods
        # Tell the generator where to put its output (what it thinks of as
        # Rails.root)
        def set_default_destination
          destination File.expand_path("../../tmp", __dir__)
        end

        def setup_default_destination
          set_default_destination
        end

        def teardown
          rm_rf(default_destination)
          super
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include(Oughta::Specs::Generators, type: :generator)
end
