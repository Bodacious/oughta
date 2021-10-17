# frozen_string_literal: true

require "spec_helper"

RSpec.describe Oughta::RSpec::Validations::UniquenessValidator, type: :validator do
  describe "#to_shoulda" do

    let(:result_string) {
      "it { should validate_uniqueness_of(:name).case_sensitive }"
    }

    let(:default_options) { { case_sensitive: true } }

    context "when no options provided" do

      it(&test_body)

    end

    it_behaves_like "it supports :case_sensitive", "validate_uniqueness_of"

    it_behaves_like "it supports :message", "validate_uniqueness_of"

    it_behaves_like "it supports :on", "validate_uniqueness_of"

    it_behaves_like "it supports :scope", "validate_uniqueness_of"
  end
end
