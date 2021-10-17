# frozen_string_literal: true

require "active_support/concern"

module ValidatorSpec
  extend ActiveSupport::Concern

  included do
    subject { described_class.new(attribute: attribute, options: options).to_shoulda }

    let(:attributes) { [:name] }

    let(:attribute) { attributes.first }

    let(:options) { {} }
  end

  def result_string
    raise NotImplementedError, "Please define an expected result string in #{self}"
  end

  module ClassMethods
    def test_body
      proc do
        if defined?(absent_string)
          expect(subject).not_to include(absent_string)
        else
          expect(subject).to include(result_string)
        end
      end
    end
  end
end

RSpec.configure do |config|
  config.include(ValidatorSpec, type: :validator)
end
