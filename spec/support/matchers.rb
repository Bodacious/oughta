# frozen_string_literal: true

module Matchers
  require_relative "matchers/association_matchers"
  require_relative "matchers/presenter_matchers"
  require_relative "matchers/validation_matchers"
end
RSpec.configure do |config|
  config.include(Matchers::AssociationMatchers, type: :association)
  config.include(Matchers::PresenterMatchers, type: :presenter)
  config.include(Matchers::ValidatorMatchers, type: :validator)
end
