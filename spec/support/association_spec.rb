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
      proc { expect(subject).to eql(result_string) }
    end
  end
end

RSpec.configure do |config|
  config.include(AssociationSpec, type: :association)
end
