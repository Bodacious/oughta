# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Validations::InclusionValidator, type: :validator do
  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { should validate_inclusion_of(:name) }" }

      it(&test_body)
    end

    it_behaves_like "it supports :allow_nil", "validate_inclusion_of"

    it_behaves_like "it supports :allow_blank", "validate_inclusion_of"

    it_behaves_like "it supports :on", "validate_inclusion_of"

    it_behaves_like "it supports :message", "validate_inclusion_of"
  end
end
