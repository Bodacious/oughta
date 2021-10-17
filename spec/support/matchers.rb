# frozen_string_literal: true

module Oughta
  module Specs
    module Matchers
      require_relative "matchers/association_matchers"
      require_relative "matchers/presenter_matchers"
      require_relative "matchers/validation_matchers"
      require_relative "matchers/generator_matchers"
    end
  end
end
RSpec.configure do |config|
  config.include(Oughta::Specs::Matchers::AssociationMatchers, type: :association)
  config.include(Oughta::Specs::Matchers::PresenterMatchers, type: :presenter)
  config.include(Oughta::Specs::Matchers::ValidatorMatchers, type: :validator)
  config.include(Oughta::Specs::Matchers::GeneratorMatchers, type: :generator)
end
