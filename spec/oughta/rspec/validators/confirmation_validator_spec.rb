# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Validations::ConfirmationValidator, type: :validator do
  describe "#to_shoulda" do
    context "when no options provided" do
      let(:result_string) do
        "it { should validate_confirmation_of(:name).case_sensitive }"
      end

      it(&test_body)
    end

    it_behaves_like "it supports :on", "validate_confirmation_of"

    it_behaves_like "it supports :message", "validate_confirmation_of"

    it_behaves_like "it supports :case_sensitive", "validate_confirmation_of"
  end
end
