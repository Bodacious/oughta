# frozen_string_literal: true

require "active_support/concern"

module AssociationSpec
  extend ActiveSupport::Concern

  included do
    subject do
      described_class.new(association_name: association_name,
                          options: options).to_shoulda
    end

    let(:association_name) { :test_class }

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
  config.include(AssociationSpec, type: :association)
end
