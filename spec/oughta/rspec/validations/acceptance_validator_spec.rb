# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Validations::AcceptanceValidator, type: :validator do
  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) { "it { should validate_acceptance_of(:name) }" }

      it(&test_body)
    end

    it_behaves_like "it supports :on", "validate_acceptance_of"

    it_behaves_like "it supports :message", "validate_acceptance_of"
  end
end
