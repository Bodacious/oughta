# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Validations::ExclusionValidator, type: :validator do
  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { should validate_exclusion_of(:name) }" }

      it(&test_body)
    end

    it_behaves_like "it supports :on", "validate_exclusion_of"

    it_behaves_like "it supports :message", "validate_exclusion_of"
  end
end
